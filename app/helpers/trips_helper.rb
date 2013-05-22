module TripsHelper
  def pretty_date_range(trip)
    if trip.start.year == trip.end.year
      "#{trip.start.strftime("%B %e")} - #{trip.end.strftime("%B %e, %Y")}"
    else
      "#{trip.start.strftime("%B %e, %Y")} - #{trip.end.strftime("%B %e, %Y")}"
    end
  end
end
