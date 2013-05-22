class TripsController < ApplicationController
  before_filter :require_login, except: [ :show ]
  before_filter :require_trip_access, only: [ :show ]

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
    @note = @trip.notes.build

    @feed_items = TripFeed.new(:trip => @trip).feed
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      render :edit, :notice => "Trip updated!"
    else
      render :edit, :error => "Update failed"
    end
  end

  def dashboard
    # we would receive page param and then filter the feed items
    @page = params[:page]

    @trips = current_user.trips
    @kreepings = current_user.kreepings

    # all_trips = (@trips + @kreepings)

    # @feed_items = all_trips.inject([]) do |memo, trip|
    #   memo += TripFeed.new(:trip => trip).feed
    # end

    current_page = params[:page] || 0
    offset = current_page * 25

    results = ActiveRecord::Base.connection.execute(SimpleFeedItem.dashboard_query)

    @feed_items = results.map do |result|
      user = User.find(result["user_id"])
      SimpleFeedItem.new(result.merge('user' => user))
    end

    # @feed_items = @feed_items.uniq.sort_by { |fi| fi.event_created_at }.reverse
  end

  private

  def trip_params
    params[:trip].merge(:start => Chronic.parse(params[:trip][:start]),
                        :end => Chronic.parse(params[:trip][:end]))
  end

  def require_trip_access
    @trip = Trip.find(params[:id])
    unless !@trip.visible || current_user.authorized_to_view(@trip)
      render :private
    end
  end
end
