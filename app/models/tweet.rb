class Tweet < ActiveRecord::Base
  extend ::UsersDatesSearchable
  include ::EventTripFinder

  attr_accessible :event_created_at,
                  :tweet_id,
                  :user_id,
                  :text

  belongs_to :user

  validates :tweet_id, :presence => true,
                       :uniqueness => true
  validates :event_created_at, :presence => true
  validates :user_id, :presence => true

  def serializable_hash(options = {})
    {
      :type => :tweet, :data => { :event_created_at => event_created_at,
                                  :text => text },
                       :user => {
                                  :user_id => user.id,
                                  :username => user.username,
                                  :avatar => user.avatar }
    }
  end
end
