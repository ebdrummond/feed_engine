class CheckIn < ActiveRecord::Base
  extend ::UsersDatesSearchable

  attr_accessible :checked_in_at,
                  :check_in_id,
                  :text,
                  :location,
                  :user_id

  belongs_to :user

  validates :check_in_id, :presence => true,
                          :uniqueness => true
  validates :checked_in_at, :presence => true
  validates :location, :presence => true
  validates :user_id, :presence => true

  def self.event_created_at
    :checked_in_at
  end

  def event_created_at
    checked_in_at
  end

  def serializable_hash(options = {})
    {
      :type => :check_in, :data => { :event_created_at => checked_in_at,
                                     :text => text,
                                     :location => location }
    }
  end
end
