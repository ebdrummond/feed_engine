class TripsController < ApplicationController
  before_filter :require_login

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to dashboard_path
    else
      render :new, :notice => 'Error!'
    end
  end

  def show
    @feed = Feed.find_by_trip(params[:id])
  end

  private

  def trip_params
    params[:trip].merge(:start => Date.parse(params[:trip][:start]),
                        :end => Date.parse(params[:trip][:end]))
  end
end
