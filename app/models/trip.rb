class Trip < ActiveRecord::Base
  attr_accessible :name,
                  :destination,
                  :start,
                  :end,
                  :visible

  belongs_to :owner, :foreign_key => 'user_id', :class_name => 'User'
  has_many :users, through: :user_trips
  has_many :user_trips, dependent: :destroy

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
    uts = UserTrip.where(:trip_role => 'traveler', :trip_id => self.id)
    uts.collect{|ut| ut.user}
  end

  def kreeprs
    uts = UserTrip.where(:trip_role => 'kreepr', :trip_id => self.id)
    uts.collect{|ut| ut.user}
  end

  def visibility_setting
    if self.visible == true
      "private"
    else
      "public"
    end
  end
end
