class Person < BaseModel

  has_one :user_account
  has_many :person_emails
  has_many :emails, through: :person_emails
  has_many :email_categories, through: :person_emails

  has_many :employees
  has_many :patients
  has_many :employee_of_practices, through: :employees, source: :practice
  has_many :patient_of_practices, through: :patients, source: :practice

  has_many :active_employees, -> { where active: true }, class_name: "Employee"
  has_many :active_patients, -> { where active: true }, class_name: "Patient"
  has_many :active_employee_of_practices, through: :active_employees, source: :practice
  has_many :active_patient_of_practices, through: :active_patients, source: :practice


end
