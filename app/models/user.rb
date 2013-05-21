class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username,
                  :avatar

  has_many :auth_sources
  has_many :tweets
  has_many :notes
  has_many :photos
  has_many :check_ins
  has_many :user_trips
  has_many :trips
  #, through: :user_trips

  validates :username, :presence => true,
                       :uniqueness => true

  def instagram_connected?
    auth_sources.collect{|a| a.provider}.include?("instagram")
  end

  def foursquare_connected?
    auth_sources.collect{|a| a.provider}.include?("foursquare")
  end

  def my_trips
    user_trips.collect{|ut| ut.trip}
  end

  def authorized_to_view(trip)
    my_trips.include?(trip)
  end

  def self.validate_exists(user)
    self.find_by_username(user)
  end
end
