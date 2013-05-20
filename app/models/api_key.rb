class ApiKey < ActiveRecord::Base
  attr_accessible :user, :key

  belongs_to :user
end
