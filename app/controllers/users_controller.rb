class UsersController < ApplicationController
  before_filter :require_login

  def account
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to account_path,
                  :notice => "Updated username to #{@user.username}"
    else
      render :account,
             :notice => "Update failed"
    end
  end
end
