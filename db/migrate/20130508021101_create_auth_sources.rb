class CreateAuthSources < ActiveRecord::Migration
  def change
    create_table :auth_sources do |t|
      t.string :token
      t.string :secret
      t.string :uid
      t.string :provider

      t.references :user

      t.timestamps
    end
    add_index :auth_sources, [:user_id, :provider], unique: true
    add_index :auth_sources, :provider
    add_index :auth_sources, :uid
  end
end
