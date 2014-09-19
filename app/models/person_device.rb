class PersonDevice < BaseModel
  belongs_to :person
  belongs_to :device
end
