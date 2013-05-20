class UserTripsController < ApplicationController

  def create
    ut = UserTrip.new(:user_id => params[:user_id],
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

  def destroy
    ut = UserTrip.where(:user_id => current_user.id,
                        :trip_id => params[:trip_id],
                        :trip_role => params[:trip_role])
    ut.destroy(ut)
    redirect_to trip_path(ut[0].trip),
                notice: "You've been removed as a #{ut[0].trip_role} from #{ut[0].trip.name}."
  end
end
