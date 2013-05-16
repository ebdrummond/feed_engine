class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username,
                  :avatar

  has_many :auth_sources
  has_many :trips, through: :traveler_trips
  has_many :trips, through: :kreepr_trips
  has_many :traveler_trips
  has_many :kreepr_trips

  validates :username, :presence => true,
                       :uniqueness => true

end
