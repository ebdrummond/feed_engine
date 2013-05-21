class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username,
                  :avatar

  has_many :auth_sources, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :check_ins, :dependent => :destroy
  has_many :trips, :dependent => :destroy
  has_many :user_trips, :dependent => :destroy
  has_one :api_key, :dependent => :destroy

  validates :username, :presence => true,
                       :uniqueness => true

  def to_param
    username
  end

  def instagram_connected?
    AuthSource.exists?(:user_id => self.id, :provider => "instagram")
  end

  def foursquare_connected?
    AuthSource.exists?(:user_id => self.id, :provider => "foursquare")
  end

  def kreepings
    UserTrip.where(:user_id => self.id, :trip_role => "kreepr").map(&:trip)
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

  def kreepings
    uts = user_trips.where(:trip_role => "kreepr")
    uts.collect{|ut| ut.trip }
  end
end
