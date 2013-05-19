class CheckIn < ActiveRecord::Base
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
end
