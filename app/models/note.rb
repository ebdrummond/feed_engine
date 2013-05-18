class Note < ActiveRecord::Base
  attr_accessible :text,
                  :trip_id

  belongs_to :user
  belongs_to :trip

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :trip_id, :presence => true
end
