class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string     :key
      t.references :user

      t.timestamps
    end
    add_index :api_keys, [ :key, :user_id ], :unique => true
    add_index :api_keys, :user_id
  end
end
