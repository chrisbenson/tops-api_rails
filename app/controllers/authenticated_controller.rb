class AuthenticatedController < ApplicationController

  before_filter :authenticate

  protected

  def authenticate

    token = request.headers["Authorization"]
    @current_user = UserAccount.user_account_from_auth_token(token)

    response.headers["Content-Type"] = "application/json; charset=utf-8"

    if @current_user.nil?
      @current_device = DeviceAccount.device_account_from_auth_token(token)
      if @current_device.nil?
        response.headers["Authorization"] = '' and head :unauthorized
      else
        response.headers["Authorization"] = @current_device.reset_auth_token(token) unless @current_device.persistent_tokens?
      end
    else
      response.headers["Authorization"] = @current_user.reset_auth_token(token) unless @current_user.persistent_tokens?
    end

  end

end
