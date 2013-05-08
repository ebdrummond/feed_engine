class User < ActiveRecord::Base
  attr_accessible :username

  has_many :auth_sources

  validates :username, :presence => true,
                       :uniqueness => true
end
