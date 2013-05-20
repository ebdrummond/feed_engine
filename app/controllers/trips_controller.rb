class TripsController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    @trip.owner = current_user
    if @trip.save
      UserTrip.create(user_id: current_user.id, trip_id: @trip.id, trip_role: "traveler")
      redirect_to dashboard_path
    else
      render :new, :notice => 'Error!'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @note = @trip.notes.build
    @tweets = @trip.tweets
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
