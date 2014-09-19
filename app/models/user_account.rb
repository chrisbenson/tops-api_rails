class UserAccount < BaseModel
  belongs_to :person
  has_many :user_auth_tokens

  def reset_auth_token(auth_token)
    user_auth_token = UserAuthToken.where(auth_token_id: auth_token).first
    user_auth_token.expires_at = DateTime.current
    user_auth_token.save!
    create_auth_token
  end

  def self.user_account_from_login(email, password)
    email = Email.where(address: email).first
    email_category = EmailCategory.where(name: 'account').first
    person_email = PersonEmail.where(email: email, email_category: email_category).first
    user_account = UserAccount.where(id: person_email.person.user_account.id, active: true).first
    SCrypt::Password.new(user_account.password_encrypted) == password ? user_account : nil
  end

  def self.user_account_from_auth_token(auth_token)
    user_auth_token = UserAuthToken.where(auth_token_id: auth_token).active.last
    user_auth_token.nil? ? nil : UserAccount.where(id: user_auth_token.user_account.id, active: true).first
  end

  def create_auth_token
    auth_token = AuthToken.create!
    UserAuthToken.create!(user_account_id: self.id, auth_token_id: auth_token.id, expires_at: Time.zone.now + 7.days)
    auth_token.id.to_s
  end

  def active_employee_of_practices
    self.person.active_employee_of_practices
  end

  def patient_of_practices
    self.person.active_patient_of_practices
  end

end
