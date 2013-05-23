class UserTripsController < ApplicationController
  before_filter :find_user_by_username, only: [ :create ]

  def create
    existing = @user.user_trips.where(:trip_id => params[:id])

    if existing.present?
      notice = "Already on trip!"
    else
      @user.user_trips.create!(:trip_id => params[:id],
                               :trip_role => params[:trip_role])
      notice = "Added to trip!"
    end
    redirect_to :back, notice: notice
  end

  def destroy
    user_trip = UserTrip.where(:user_id => params[:user_id],
                               :trip_id => params[:id]).first
    user_trip.destroy
    redirect_to :back, notice: "Removed from trip!"
  end

  private

  def find_user_by_username
    @user = User.find_by_username(params[:username])

    if @user.nil?
      redirect_to :back, notice: "Username not found!"
    end
  end
end
