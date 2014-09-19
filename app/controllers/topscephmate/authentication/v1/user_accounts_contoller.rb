class Topscephmate::V1::UserAccountsController < ApplicationController

  def create

    email = params[:email]
    password = params[:password]
    first_name = params[:first_name]
    last_name = params[:last_name]
    practice_code = params[:practice_code]

    self.set_locale_for_create_user_account

    if Email.where(address: email).first.nil?
      person = Person.create!(first_name: first_name, last_name: last_name)
      practice = Practice.where(code: practice_code)
      Employee.create!(person: person, practice: practice)
      encrypted_password = UserAccount.encrypt(password)
      UserAccount.create!(password_digest: encrypted_password, person: person, active: true, locale: @locale)
    end
  end

  def show
    # to do
  end

  def update
    # to do
  end

  def destroy
    # to do
  end

  protected

  def set_locale_for_create_user_account
    @locale = params[:locale] if (params.has_key? :locale and params[:locale] =~ /^[a-z]{2}-[A-Z]{2}$/)
  end

end
