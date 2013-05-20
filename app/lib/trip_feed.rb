class TripFeed
  attr_reader :trip

  def initialize(params)
    @trip = params[:trip]
  end

  def feed
    notes + tweets + photos + check_ins
  end

  def notes
    @notes ||= trip.notes.all
  end

  private

  def tweets
    @tweets ||= Tweet.for_users(travelers).in_range(trip.start, trip.end)
  end

  def photos
    @photos ||= Photo.for_users(travelers).in_range(trip.start, trip.end)
  end

  def check_ins
    @check_ins ||= CheckIn.for_users(travelers).in_range(trip.start, trip.end)
  end

  def travelers
    @travelers ||= trip.travelers
  end
end

