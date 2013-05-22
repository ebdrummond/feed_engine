class AuthSourcesController < ApplicationController
  before_filter :require_login

  def create
    auth_params = AuthParams.new(auth_hash)

    auth_source = AuthSource.new(auth_params.auth_source_params)
    auth_source.user = current_user

    if auth_source.save
      redirect_to account_path,
        :notice => "#{auth_source.provider.titleize} account connected!"
    else
      redirect_to account_path,
        :error => "Service could not be connected!"
    end
  end

  def destroy
    auth_source = AuthSource.where(:user_id => current_user.id,
                                   :provider => params[:provider]).first
    auth_source.destroy

    redirect_to account_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
