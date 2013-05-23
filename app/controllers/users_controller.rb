class UsersController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def show
    @user = User.find_by_username!(params[:username])

    @trips = UserShow.new(:profile_user => @user, :current_user => current_user)
  end

  def account
    @user = current_user
    @auth_source_providers = AuthSource.where(:user_id => current_user.id)
                                       .pluck(:provider)
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to account_path, :notice => "Updated username"
    else
      render :account
    end
  end

  def destroy
    current_user.destroy
    logout
    redirect_to root_path, :notice => "Account deleted"
  end
end
