class PersonEmail < BaseModel
  belongs_to :person
  belongs_to :email
  belongs_to :email_category
end
