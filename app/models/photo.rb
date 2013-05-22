class Photo < ActiveRecord::Base
  extend ::UsersDatesSearchable
  include ::EventTripFinder

  attr_accessible :event_created_at,
                  :photo_id,
                  :url,
                  :caption,
                  :user_id

  belongs_to :user

  validates :photo_id, :presence => true,
                       :uniqueness => true
  validates :event_created_at, :presence => true
  validates :user_id,  :presence => true
  validates :url,      :presence => true

  def serializable_hash(options = {})
    {
      :type => :photo, :data => { :event_created_at => event_created_at,
                                  :url => url,
                                  :caption => caption },
                       :user => {
                                  :user_id => user.id,
                                  :username => user.username,
                                  :avatar => user.avatar }
    }
  end
end
