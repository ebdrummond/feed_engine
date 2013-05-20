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
    # @tweets ||= Tweet.where('user_id IN (?)', trip.travelers)
    #                  .where(:tweeted_at => trip.start..trip.end)
  end

  def photos
    @photos ||= Tweet.for_users(travelers).in_range(trip.start, trip.end)
    # @photos ||= Photo.where('user_id IN (?)', trip.travelers)
    #                  .where(:taken_at => trip.start..trip.end)
  end

  def check_ins
    @check_ins ||= CheckIn.for_users(travelers).in_range(trip.start, trip.end)
    # @check_ins ||= CheckIn.where('user_id IN (?)', trip.travelers)
    #                       .where(:checked_in_at => trip.start..trip.end)
  end

  def travelers
    @travelers ||= trip.travelers
  end
end

