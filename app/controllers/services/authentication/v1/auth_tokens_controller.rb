class Services::Authentication::V1::AuthTokensController < ApplicationController

  def create
    @current_user = UserAccount.user_account_from_login(params[:auth_token][:email], params[:auth_token][:password])
    if @current_user.nil?
      head :unauthorized
    else
      response.headers["Authorization"] = @current_user.create_auth_token and head :no_content
    end
  end

  def destroy

    if request.headers["Authorization"] == params[:auth_token][:id]
      auth_token = AuthToken.where(auth_token: params[:auth_token][:id]).first
      user_auth_token = UserAuthToken.where(auth_token: auth_token).first
      user_auth_token.expires_at = DateTime.current
      user_auth_token.save!
      head :ok
    else
      head :unauthorized
    end

  end

end
