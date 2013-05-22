class Note < ActiveRecord::Base
  attr_accessible :text,
                  :trip_id

  belongs_to :user
  belongs_to :trip

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :trip_id, :presence => true

  def self.event_created_at
    :created_at
  end

  def event_created_at
    created_at
  end

  def serializable_hash(options = {})
    {:type => :note, :data => {
                                :event_created_at => created_at,
                                :text => text },
                     :user => {
                                :user_id => user.id,
                                :username => user.username,
                                :avatar => user.avatar }
    }
  end
end
