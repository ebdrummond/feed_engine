class TripsController < ApplicationController
  before_filter :require_login, except: [ :show ]

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save_with_user_trip
      redirect_to trip_path(@trip)
    else
      render :new, :error => 'Error!'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @note = @trip.notes.build

    @feed_items = TripFeed.new(:trip => @trip).feed
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @trips = current_user.trips
    @kreepings = current_user.kreepings

    @feed_items = (@trips + @kreepings).inject([]) do |memo, trip|
      memo += TripFeed.new(:trip => trip).feed
    end

    @feed_items = @feed_items.uniq.sort_by { |fi| fi.event_created_at }.reverse
  end

  private

  def trip_params
    params[:trip].merge(:start => Chronic.parse(params[:trip][:start]),
                        :end => Chronic.parse(params[:trip][:end]))
  end
end
