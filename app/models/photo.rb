class Photo < ActiveRecord::Base
  attr_accessible :taken_at,
                  :photo_id,
                  :url,
                  :caption,
                  :user_id

  belongs_to :user

  validates :photo_id, :presence => true,
                       :uniqueness => true
  validates :taken_at, :presence => true
  validates :user_id,  :presence => true
  validates :url,      :presence => true
end
