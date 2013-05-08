class SessionsController < ApplicationController
  def create
    @user = CreateUser.from_unknown_auth_source(auth_hash)

    if @user.valid?
      login_user(@user)
      redirect_to dashboard_path, :notice => "Signed in"
    else
      redirect_to root_path, :notice => "Failure"
    end
  end

  def error
    redirect_to root_path, :notice => "Error"
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end
