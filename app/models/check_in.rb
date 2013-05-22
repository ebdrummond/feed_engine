class CheckIn < ActiveRecord::Base
  extend ::UsersDatesSearchable

  attr_accessible :checked_in_at,
                  :check_in_id,
                  :text,
                  :venue,
                  :user_id

  belongs_to :user

  serialize :venue, Hash

  validates :checked_in_at, :presence => true
  validates :check_in_id, :presence => true,
                          :uniqueness => true
  validates :venue, :presence => true
  validates :user_id, :presence => true

  def self.event_created_at
    :checked_in_at
  end

  def event_created_at
    checked_in_at
  end

  def trip
    self.user.travelings.select{|t| (t.start..t.end).cover?(self.checked_in_at.to_date)}.first
  end

  def serializable_hash(options = {})
    {
      :type => :check_in, :data => { :event_created_at => checked_in_at,
                                     :text => text,
                                     :venue => venue,
                                     :location => location },
                          :user => {
                                     :user_id => user.id,
                                     :username => user.username,
                                     :avatar => user.avatar }
    }
  end
end
