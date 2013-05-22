class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username,
                  :avatar

  before_validation :parameterize_path

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

  def kreepings
    user_trips.where(:trip_role => "kreepr").map(&:trip)
  end

  def travelings
    user_trips.where(:trip_role => "traveler").map(&:trip)
  end

  def my_trips
    (kreepings + travelings).uniq
  end

  def authorized_to_view(trip)
    my_trips.include?(trip)
  end

  def current_trips
    travelings.select{|t| (t.start..t.end).cover?(Date.today)}
  end

  def upcoming_trips
    travelings.select{|t| t.start > Date.today}
  end

  def past_trips
    travelings.select{|t| t.end < Date.today}
  end

  private

  def parameterize_path
    self.username = username.parameterize
  end
end
