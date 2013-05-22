class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.datetime   :event_created_at
      t.string     :check_in_id
      t.text       :text
      t.string     :location

      t.references :user

      t.timestamps
    end
    add_index :check_ins, :user_id
    add_index :check_ins, :check_in_id, unique: true
  end
end
