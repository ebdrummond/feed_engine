class SessionsController < ApplicationController
  def create
    user = FindOrCreateUser.from_auth_source(auth_hash)

    if user.valid?
      ApiKey.create!(:user => user, :key => SecureRandom.uuid)
      auto_login(user)

      redirect_to dashboard_path, :notice => "Signed in"
    else
      redirect_to root_path, :error => "Failed to sign in."
    end
  end

  def error
    redirect_to root_path, :error => "Error"
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
