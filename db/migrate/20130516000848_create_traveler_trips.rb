class CreateTravelerTrips < ActiveRecord::Migration
  def change
    create_table :traveler_trips do |t|
      t.references :user
      t.references :trip

      t.timestamps
    end
    add_index :traveler_trips, :user_id
    add_index :traveler_trips, :trip_id
  end
end
