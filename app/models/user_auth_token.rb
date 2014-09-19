class UserAuthToken < BaseModel
  belongs_to :user_account
  belongs_to :auth_token

  scope :active, -> { where("expires_at > ?", Time.zone.now) }

end
