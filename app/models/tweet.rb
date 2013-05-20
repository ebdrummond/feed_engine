class Tweet < ActiveRecord::Base
  extend ::UsersDatesSearchable

  attr_accessible :tweeted_at,
                  :tweet_id,
                  :user_id,
                  :text

  belongs_to :user

  validates :tweet_id, :presence => true,
                       :uniqueness => true
  validates :tweeted_at, :presence => true
  validates :user_id, :presence => true

  def self.event_created_at
    :tweeted_at
  end

  def event_created_at
    tweeted_at
  end
end
