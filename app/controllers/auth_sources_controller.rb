class AuthSourcesController < ApplicationController
  before_filter :require_login

  def create
    new_auth_source = Authentication.parse_hash(auth_hash)
    new_auth_source.user_id = current_user.id
    new_auth_source.save
    redirect_to root_path
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end