class TripsController < ApplicationController
  respond_to :html, :json
  before_filter :require_login, except: [ :show ]

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      @trip.save_owner_as_user(current_user, @trip)
      redirect_to dashboard_path
    else
      render :new, :notice => 'Error!'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @note = @trip.notes.build

    if !@trip.visible || current_user.authorized_to_view(@trip)
      render :show
    else
      render :private
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(params[:trip])
    respond_with @trip
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
