class TwitterService
  attr_reader :client, :user

  def initialize(params)
    @client = self.class.client_for_user(params['token'], params['secret'])
    @user = User.find(params['user_id'])
  end

  def fetch_and_store_tweets
    fetch_tweets.each do |tweet|
      store_tweet(tweet)
    end
  end

  private

  def fetch_tweets
    # TODO: Time permitting - if any error thrown, log and next
    client.user_timeline(:count           => 200,
                         :since_id        => latest_tweet_id,
                         :trim_user       => true,
                         :exclude_replies => true)
  end

  def latest_tweet_id
    user.tweets.order('tweeted_at DESC').limit(1).pluck(:tweet_id).first || 1
  end

  def store_tweet(tweet)
    Tweet.create(:tweeted_at => Time.at(tweet.created_at),
                 :tweet_id   => tweet.id,
                 :text       => tweet.text,
                 :user_id    => user.id)
  end

  def self.client_for_user(token, secret)
    Twitter::Client.new(:oauth_token        => token,
                        :oauth_token_secret => secret,
                        :consumer_key       => ENV['TWITTER_KEY'],
                        :consumer_secret    => ENV['TWITTER_SECRET'])
  end

end
