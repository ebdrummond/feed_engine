class UserTrip < ActiveRecord::Base
  attr_accessible :user_id, :trip_id, :trip_role

  belongs_to :trip
  belongs_to :user

  validates :user_id, :presence => true
  validates :trip_id, :presence => true
  validates :trip_role, :presence => true
end
