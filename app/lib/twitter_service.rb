class TwitterService
  def self.retrieve_and_store_tweets_for_user(params)
    client = client_for_user(params['token'], params['secret'])
    tweets = request_tweets_for_user(client, params['user_id'])

    store_tweets(params['user_id'], tweets)
  end

  private

  def self.client_for_user(token, secret)
    Twitter::Client.new(:oauth_token        => token,
                        :oauth_token_secret => secret,
                        :consumer_key       => ENV['TWITTER_KEY'],
                        :consumer_secret    => ENV['TWITTER_SECRET'])
  end

  def self.request_tweets_for_user(client, user_id)
    client.user_timeline(:count           => 200,
                         :since_id        => latest_tweet_id(user_id) || 1,
                         :trim_user       => true,
                         :exclude_replies => true)
  end

  def self.latest_tweet_id(user_id)
    user = User.find(user_id)
    user.tweets.order('tweeted_at DESC').limit(1).pluck(:tweet_id).first
  end

  def self.store_tweets(user_id, tweets)
    tweets.each do |tweet|
      Tweet.create(:tweeted_at => DateTime.parse(tweet.created_at.to_s),
                   :tweet_id   => tweet.id,
                   :text       => tweet.text,
                   :user_id    => user_id)
    end
  end
end
