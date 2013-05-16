class TravelerTrip < ActiveRecord::Base
  attr_accessible :user_id, :trip_id

  belongs_to :trip
  belongs_to :user

  validates :user_id, :presence => true
  validates :trip_id, :presence => true
end
