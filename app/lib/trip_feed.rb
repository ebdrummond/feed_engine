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

  def tweets
    @tweets ||= Tweet.where('user_id IN (?)', trip.travelers)
                     .where(:tweeted_at => trip.start..trip.end)
                     .all
  end

  def photos
    @photos ||= Photo.where('user_id IN (?)', trip.travelers)
                     .where(:taken_at => trip.start..trip.end)
                     .all
  end

  def check_ins
    @check_ins ||= CheckIn.where('user_id IN (?)', trip.travelers)
                          .where(:checked_in_at => trip.start..trip.end)
                          .all
  end
end
