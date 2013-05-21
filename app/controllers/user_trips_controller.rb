class UserTripsController < ApplicationController

  def create_kreeping
    ut = current_user.user_trips.build(:trip_id => params[:trip_id],
                                       :trip_role => "kreepr")

    if ut.save
      redirect_to :back,
                  notice: "You've been added to #{ut.trip.name} as a kreepr!"
    else
      redirect_to :back,
                  notice: "Sorry - something went wrong!"
    end
  end

  def destroy
    ut = UserTrip.where(:user_id => params[:user_id],
                        :trip_id => params[:trip_id],
                        :trip_role => params[:trip_role])
    ut[0].destroy
    redirect_to :back,
                notice: "#{ut[0].username} is no longer a #{ut[0].trip_role} on #{ut[0].trip.name}."
  end

  def create_traveler
    new_traveler = User.validate_exists(params[:username])

    if new_traveler
      ut = new_traveler.user_trips.build(:trip_id => params[:trip_id],
                                         :trip_role => "traveler")
      if ut.save
        redirect_to :back,
                    notice: "#{ut.user.username} has been added as a traveler to #{ut.trip.name}!"
      else
        redirect_to :back,
                  notice: "Sorry - something went wrong!"
      end
    else
      redirect_to :back,
                  notice: "This user doesn't exist!"
    end
  end

  def create_kreepr
    new_kreepr = User.validate_exists(params[:username])

    if new_kreepr
      ut = new_kreepr.user_trips.build(:trip_id => params[:trip_id],
                                       :trip_role => "kreepr")
      if ut.save
        redirect_to :back,
                    notice: "#{ut.user.username} has been added as a kreepr to #{ut.trip.name}!"
      else
        redirect_to :back,
                  notice: "Sorry - something went wrong!"
      end
    else
      redirect_to :back,
                  notice: "This user doesn't exist!"
    end
  end
end
