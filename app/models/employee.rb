class Employee < ActiveRecord::Base
  belongs_to :person
  belongs_to :practice

  scope :active, -> { where(active: true) }

end
