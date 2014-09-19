class DeviceAuthToken < BaseModel
  belongs_to :device_account
  belongs_to :auth_token

  scope :active, -> { where("expires_at > ?", Time.zone.now) }

end
