class DropTravelerTripsAndKreeprTrips < ActiveRecord::Migration
  def change
    drop_table :traveler_trips
    drop_table :kreepr_trips
  end
end
