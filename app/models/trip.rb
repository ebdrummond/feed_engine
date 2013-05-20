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
    user_trips = UserTrip.where(:trip_role => 'traveler', :trip_id => self.id)
    user_trips.collect { |user_trip| user_trip.user }.append owner
  end

  def save_with_user_trip
    transaction do
      save
      owner.user_trips.create!({:trip_id => self.id, :trip_role => 'traveler'})
      self
    end
  end

  # def self.create_user_and_auth_source(auth_source_params, user_params)
  #   User.transaction do
  #     user = create_with_username(user_params)
  #     user.auth_sources.create!(auth_source_params)
  #     user
  #   end
  # end



  # def kreeprs
  #   uts = UserTrip.where(:trip_role => 'kreepr', :trip_id => self.id)
  #   uts.collect{|ut| ut.user}
  # end

  # def visibility_setting
  #   self.visible == true ? "private" : "public"
  # end

  # def tweets
  #   start = self.start
  #   ending = self.end
  #   trip_user_tweets.select do |tweet|
  #     tweet.tweeted_at.to_date.between?(start, ending)
  #   end
  # end

  # def trip_user_tweets
  #   Tweet.where(:user_id => self.users)
  # end
end
