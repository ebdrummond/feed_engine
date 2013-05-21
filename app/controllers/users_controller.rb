class UsersController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def show
    @user = User.find_by_username!(params[:username])
  end

  def account
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to account_path,
                  :notice => "Updated username to #{@user.username}"
    else
      render :account
    end
  end
end
