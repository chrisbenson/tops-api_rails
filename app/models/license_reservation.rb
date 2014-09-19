class LicenseReservation < BaseModel
  belongs_to :license
  belongs_to :device
  belongs_to :person
end
