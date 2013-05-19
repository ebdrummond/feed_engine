class AuthSourcesController < ApplicationController
  before_filter :require_login

  def create
    auth_source = Authentication.parse_hash(auth_hash)
    auth_source.user = current_user

    if auth_source.save
      redirect_to account_path,
        :notice => "#{auth_source.provider.titleize} account connected!"
    else
      redirect_to account_path,
        :notice => "#{auth_source.provider.titleize} account connected!"
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
