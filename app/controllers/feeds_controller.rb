class FeedsController < ApplicationController
  before_filter :require_login

  def index
    # user = Twitter::Client.new(
    #   :oauth_token => current_user.auth_sources.first.token,
    #   :oauth_token_secret => current_user.auth_sources.first.secret,
    #   :consumer_key => ENV['TWITTER_KEY'],
    #   :consumer_secret => ENV['TWITTER_SECRET']
    # )

    # @feed = user.user_timeline
  end
end
