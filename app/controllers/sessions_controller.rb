class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_oauth(auth_hash)

    if @user.valid?
      # send to dashboard
    else
      # throw error, redirect to login page
    end

    # WHICH provider ?
    # twitter_token = auth_hash['credentials']['token']
    # twitter_secret = auth_hash['credentials']['secret']
    # twitter_nickname = auth_hash['info']['nickname']
    # twitter_uid = auth_hash['uid']

    redirect_to dashboard_path, notice: "Signed in"
  end

  def error
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end


  create_table :services do |t|
    t.references :user

    t.string :token
    t.string :secret
    t.string :nickname
    t.string :uid

    t.string :type
    # Should this be STI ? Or should this rather be a foreign key to another table of services supported? (this table would only ever have 3 rows)
  end


class User < ActiveRecord::Model
  # What columns?
  # >= 4 per service (token, secret, nickname, uid)
  # Service or Account tables (hold these 4 attrs per service, FK is user_id)
  # username (default is from service they used to sign-in. If taken, modify and set. They can edit afterwards)

  def self.find_or_create_from_oauth(oauth_hash)
    service = parse_service(oauth_hash)
    token = parse_token(oauth_hash)
    case service
    when 'twitter' then Service.where(user_id: id, type: 'twitter', token: token)
    when 'twitter' then DO SOMETHING
    when 'twitter' then DO SOMETHING
  end

  def parse_service(oath_hash)
    # example
    return 'twitter'
  end
end
