class Email < BaseModel

  has_many :person_emails
  has_many :people, through: :person_emails
  has_many :email_categories, through: :person_emails

end
