class Topscephmate::V1::LicenseTokensController < AuthenticatedController

  def create
    machine_name = params[:machine_name]
    mac_address = params[:mac_address]
    practice = self.practice_for_this_license_token(params)
    system = System.where(code: 'topscephmate').first
    license = License.where(practice: practice, system: system).active.first
    self.create_license_token(license, mac_address, machine_name)
  end

  def destroy
    license_token_id = params[:license_token_id]
    license_token = LicenseToken.where(id: license_token_id).first
    self.expire_license_token(license_token)
    render nothing: true, status: 204
  end

  def update
    license_token_id = params[:license_token_id]
    license_token = LicenseToken.where(id: license_token_id).first
    license = license_token.license
    mac_address = license_token.device.mac_address
    machine_name = license_token.device.machine_name
    self.expire_license_token(license_token)
    self.create_license_token(license, mac_address, machine_name)
  end

  protected

    def create_license_token(license, mac_address, machine_name)
      if license.tokens_available?
        device = self.device_for_this_license_token(mac_address, machine_name, license.practice)
        @license_token = LicenseToken.create(
            license_id: license.id,
            device_id: device.id,
            person_id: @current_user.person.id,
            expires_at: self.license_token_expires_at(license)
        )
        render json: @license_token, serializer: Topscephmate::V1::LicenseTokenSerializer
      else
        render nothing: true, status: 403 # Forbidden
      end
    end

  def practice_for_this_license_token(params)
    if @current_user and @current_device.nil?
      if params.has_key? :practice_id
        practice_id = params[:practice_id]
        Practice.where(id: practice_id).first
      elsif @current_user.active_employee_of_practices.count == 1
        @current_user.active_employee_of_practices.first
      else
        render nothing: true, status: 409 # Conflict
      end
    end
  end

  def device_for_this_license_token(mac_address, machine_name, practice)
    device = Device.where(mac_address: mac_address).first
    if device.nil?
      device = Device.create!(name: machine_name, mac_address: mac_address)
      PersonDevice.create!(person: @current_user.person, device: device)
      PracticeDevice.create!(practice: practice, device: device)
    end
    device
  end

  def license_token_expires_at(license)
    Time.current + license.token_duration_seconds
  end

  private

  def expire_license_token(license_token)
    license_token.expires_at = Time.current
    license_token.save!
  end

end
