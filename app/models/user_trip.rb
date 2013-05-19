class UserTrip < ActiveRecord::Base
  attr_accessible :user_id, :trip_id, :trip_role

  belongs_to :trip
  belongs_to :user
end
