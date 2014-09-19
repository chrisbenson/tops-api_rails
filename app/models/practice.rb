class Practice < BaseModel

  has_many :employees
  has_many :patients
  has_many :people_who_are_employees, through: :employees, source: :person
  has_many :people_who_are_patients, through: :patients, source: :person

  has_many :active_employees, -> { where active: true }, class_name: "Employee"
  has_many :active_patients, -> { where active: true }, class_name: "Patient"
  has_many :people_who_are_active_employees, through: :active_employees, source: :person
  has_many :people_who_are_active_patients, through: :active_patients, source: :person

  has_many :licenses
  has_many :systems, through: :licenses

end
