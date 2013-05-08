class AuthSource < ActiveRecord::Base
  attr_accessible :provider,
                  :token,
                  :secret,
                  :nickname,
                  :uid,
                  :user

  has_one :user
end
