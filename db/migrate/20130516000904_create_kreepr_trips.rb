class CreateKreeprTrips < ActiveRecord::Migration
  def change
    create_table :kreepr_trips do |t|
      t.references :user
      t.references :trip

      t.timestamps
    end
    add_index :kreepr_trips, :user_id
    add_index :kreepr_trips, :trip_id
  end
end
