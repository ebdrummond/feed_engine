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
    user_trips.where(:trip_role => 'traveler').map(&:user)
  end

  def kreeprs
    user_trips.where(:trip_role => 'kreepr').map(&:user)
  end

  def save_with_user_trip
    transaction do
      save
      owner.user_trips.create!(:trip_id => self.id, :trip_role => 'traveler')
      self
    end
  end

  def user_authorized_to_view?(user)
    !visible || (user && user_trips.exists?(:user_id => user.id))
  end
end
