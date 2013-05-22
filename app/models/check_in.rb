class CheckIn < ActiveRecord::Base
  extend ::UsersDatesSearchable
  include ::EventTripFinder

  attr_accessible :event_created_at,
                  :check_in_id,
                  :text,
                  :venue,
                  :user_id

  belongs_to :user

  serialize :venue, Hash

  validates :event_created_at, :presence => true
  validates :check_in_id, :presence => true,
                          :uniqueness => true
  validates :venue, :presence => true
  validates :user_id, :presence => true

  def serializable_hash(options = {})
    {
      :type => :check_in, :data => { :event_created_at => event_created_at,
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
