class AuthSource < ActiveRecord::Base
  attr_accessible :provider,
                  :token,
                  :secret,
                  :uid

  belongs_to :user

  validates :provider, :presence => true
  validates :token, :presence => true
  validates :secret, :presence => true,
                     :if => lambda { |auth_source| auth_source.provider == 'twitter' }
  validates :uid, :presence => true
  validates :user_id, :presence => true

  def self.grouped_by_provider
    all.group_by { |auth_source| auth_source.provider }
  end
end
