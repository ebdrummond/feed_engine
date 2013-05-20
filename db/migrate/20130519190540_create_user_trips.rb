class CreateUserTrips < ActiveRecord::Migration
  def change
    create_table :user_trips do |t|
      t.references :user
      t.references :trip
      t.string     :trip_role

      t.timestamps
    end

    add_index :user_trips, [ :user_id, :trip_id ], :unique => true
    add_index :user_trips, :trip_id
  end
end
