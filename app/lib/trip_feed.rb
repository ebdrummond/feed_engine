class TripFeed
  attr_reader :trip

  def initialize(params)
    @trip = params[:trip]
  end

  def feed
    @feed ||= aggregate.sort_by { |event| event.event_created_at }.reverse
  end

  def notes
    @notes ||= trip.notes.limit(5).all
  end

  private

  def aggregate
    notes + tweets + photos + check_ins
  end

  def tweets
    @tweets ||= Tweet.limit(5).for_users(travelers).in_range(trip.start, trip.end)
  end

  def photos
    @photos ||= Photo.limit(5).for_users(travelers).in_range(trip.start, trip.end)
  end

  def check_ins
    @check_ins ||= CheckIn.limit(5).for_users(travelers).in_range(trip.start, trip.end)
  end

  def travelers
    @travelers ||= trip.travelers
  end
end

