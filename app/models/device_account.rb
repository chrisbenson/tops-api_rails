class DeviceAccount < BaseModel
  belongs_to :device
  belongs_to :practice

  def self.device_account_from_auth_token(auth_token)
    device_auth_token = DeviceAuthToken.where(auth_token_id: auth_token).active.last
    device_auth_token.nil? ? device_account = nil : device_account = device_auth_token.device_account
    device_account
  end

end
