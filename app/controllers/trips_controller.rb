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
      render :new, :error => 'Error!'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @note = @trip.notes.build

    # TODO: Bad place to dogfood gem (gem requires current_user, trip show does not)
    if current_user
      ::FeedBurner.configure do |config|
        config.api_key = current_user.api_key.to_s
      end
      @feed_items = ::FeedBurner.feed(:username => current_user.username,
                                      :trip_id => @trip.id.to_s)
    else
      @feed_items = TripFeed.new(:trip => @trip).feed
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @trips = current_user.trips
    @kreepings = []
    @feeds = []
    # feed_items should be most recent items from all trips (you are traveler or kreepr)
  end

  private

  def trip_params
    params[:trip].merge(:start => Chronic.parse(params[:trip][:start]),
                        :end => Chronic.parse(params[:trip][:end]))
  end
end
