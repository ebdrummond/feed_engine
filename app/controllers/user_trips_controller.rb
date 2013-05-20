class UserTripsController < ApplicationController

  def create
    ut = UserTrip.create(:user_id => current_user.id,
                         :trip_id => params[:trip_id],
                         :trip_role => params[:trip_role])
    if ut.save
      redirect_to :back,
                  notice: "You've been added as a #{ut.trip_role} to #{ut.trip.name}!"
    else
      redirect_to :back,
                  notice: "Sorry - something went wrong!"
    end
  end
end