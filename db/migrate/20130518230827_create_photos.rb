class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.datetime   :taken_at
      t.string     :photo_id
      t.string     :url
      t.text       :caption

      t.references :user

      t.timestamps
    end

    add_index :photos, :user_id
    add_index :photos, :photo_id, unique: true
  end
end
