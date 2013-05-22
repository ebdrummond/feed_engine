class Trip < ActiveRecord::Base
  attr_accessible :name,
                  :destination,
                  :start,
                  :end,
                  :visible

  belongs_to :owner, :foreign_key => 'user_id', :class_name => 'User'
  has_many :users, through: :user_trips
  has_many :user_trips, dependent: :destroy
  has_many :notes

  validate :end_date_cannot_be_earlier_than_start_date

  validates :name, :presence => true
  validates :destination, :presence => true
  validates :start, :presence => true
  validates :end, :presence => true
  validates :owner, :presence => true

  def end_date_cannot_be_earlier_than_start_date
    if self.end.present? && self.start.present? && self.end < self.start
      errors.add(:end, "can't be earlier than start")
    end
  end

  def travelers
    UserTrip.where(:trip_role => 'traveler', :trip_id => self).map(&:user)
  end

  def kreeprs
    UserTrip.where(:trip_role => 'kreepr', :trip_id => self).map(&:user)
  end

  def save_with_user_trip
    transaction do
      save
      owner.user_trips.create!(:trip_id => self.id, :trip_role => 'traveler')
      self
    end
  end

  def save_owner_as_user(owner, trip)
    owner.user_trips.create(trip_id: trip.id, trip_role: "traveler")
  end

  def pretty_date_range
    if self.start.year == self.end.year
      "#{self.start.strftime("%B %e")} - #{self.end.strftime("%B %e, %Y")}"
    else
      "#{self.start.strftime("%B %e, %Y")} - #{self.end.strftime("%B %e, %Y")}"
    end
  end
end
