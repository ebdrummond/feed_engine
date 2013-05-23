class TripFeed
  attr_reader :trip, :page, :per

  def initialize(params)
    @trip = params[:trip]
    @page = params[:page]
    @per = params[:per] || 5
  end

  def feed
    @feed ||= aggregate.sort_by { |event| event.event_created_at }.reverse
  end

  def notes
    @notes ||= trip.notes.page(page).per(2).all
  end

  private

  def aggregate
    notes + tweets + photos + check_ins
  end

  def tweets
    @tweets ||= Tweet.page(page).per(per).for_users(travelers).in_range(trip.start, trip.end)
  end

  def photos
    @photos ||= Photo.page(page).per(per).for_users(travelers).in_range(trip.start, trip.end)
  end

  def check_ins
    @check_ins ||= CheckIn.page(page).per(per).for_users(travelers).in_range(trip.start, trip.end)
  end

  def travelers
    @travelers ||= trip.travelers
  end
end

