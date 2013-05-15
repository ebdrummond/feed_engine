class Tweet < ActiveRecord::Base
  attr_accessible :tweeted_at,
                  :tweet_id,
                  :user_id,
                  :text

  validates :tweet_id, :presence => true,
                       :uniqueness => true
  validates :tweeted_at, :presence => true
  validates :user_id, :presence => true
end
