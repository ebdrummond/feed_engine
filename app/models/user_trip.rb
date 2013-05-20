class UserTrip < ActiveRecord::Base
  attr_accessible :trip_id, :trip_role

  belongs_to :trip
  belongs_to :user

  validates :user_id, :presence => true
  validates :trip_id, :presence => true
  validates :trip_role, :presence => true,
                        :inclusion => {:in => ['traveler', 'kreepr'],
                                       :message => "%{value} is not a valid role" }
end
