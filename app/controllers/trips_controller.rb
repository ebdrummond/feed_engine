class TripsController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save_with_user_trip
      redirect_to dashboard_path
    else
      render :new, :notice => 'Error!'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @note = @trip.notes.build
    @tweets = []
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @trips = current_user.trips
    @kreepings = []
    @feeds = Tweet.all
  end

  private

  def trip_params
    params[:trip].merge(:start => Chronic.parse(params[:trip][:start]),
                        :end => Chronic.parse(params[:trip][:end]))
  end
end
