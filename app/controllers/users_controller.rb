class UsersController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def show
    @user = User.find_by_username!(params[:username])

    @user == current_user ? all_trips : filtered_trips
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

  private

  def all_trips
    @trips = Trip.for_user_grouped_by_date(@user)
    # @current_trips = @user.current_trips
    # @past_trips = @user.past_trips
    # @upcoming_trips = @user.upcoming_trips
  end

  def filtered_trips
    @trips = Trip.for_user_grouped_by_date(@user, :filter => true)
    # @current_trips = @user.current_trips.select{|t| !t.visible || current_user && current_user.authorized_to_view(t)}
    # @past_trips = @user.past_trips.select{|t| !t.visible || current_user && current_user.authorized_to_view(t)}
    # @upcoming_trips = @user.upcoming_trips.select{|t| !t.visible || current_user && current_user.authorized_to_view(t)}
  end
end
