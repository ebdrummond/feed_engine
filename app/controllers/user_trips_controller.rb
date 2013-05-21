class UserTripsController < ApplicationController

  def create_kreeping
    ut = current_user.user_trips.build(:trip_id => params[:trip_id],
                                  :trip_role => params[:trip_role])

    if ut.save
      redirect_to :back,
                  notice: "You've been added to #{ut.trip.name} as a kreepr!"
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
                notice: "#{ut.user.username} is no longer a #{ut[0].trip_role} on #{ut[0].trip.name}."
  end

  def create_traveler
    traveler = params[:traveler]
  end
end
