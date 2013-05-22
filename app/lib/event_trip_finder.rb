module EventTripFinder
  def trip
    self.user.travelings.find {|t| (t.start..t.end).cover?(self.event_created_at.to_date)}
  end
end