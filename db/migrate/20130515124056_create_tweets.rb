class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime   :event_created_at,   :null => false
      t.string     :tweet_id,     :null => false
      t.string     :text

      t.references :user,         :null => false

      t.timestamps
    end

    add_index :tweets, :user_id
    add_index :tweets, :tweet_id, unique: true
  end
end
