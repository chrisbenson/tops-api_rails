class EmailCategory < BaseModel

  has_many :person_emails
  has_many :people, through: :person_emails
  has_many :emails, through: :person_emails

end
