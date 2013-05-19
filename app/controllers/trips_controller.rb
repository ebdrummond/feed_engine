class TripsController < ApplicationController
  before_filter :require_login, only: [ :new, :create, :dashboard ]

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
    @trip = Trip.find(params[:id])
    @note = Note.new
    # @tweets = Tweet.where("? >= ? AND ? <= ?", :created_at,
    #                                            @trip.start,
    #                                            :created_at,
    #                                            @trip.end)
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
