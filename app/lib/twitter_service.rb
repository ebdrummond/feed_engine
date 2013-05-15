class TwitterService
  def self.update
    accounts = AuthSource.where(:provider => 'twitter').all
    accounts.each do |account|
      client = client_for_user(account.token, account.secret)
      tweets = request_tweets_for_user(client, account.user_id)

      store_tweets(account.user_id, tweets)
    end
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
                         :since_id        => latest_tweet_id(user_id),
                         :trim_user       => true,
                         :exclude_replies => true)
  end

  def self.latest_tweet_id(user_id)
    # user = User.find(user_id)
    latest_tweet = Tweet.where(user_id: user_id).limit(1).first
    # latest_tweet = user.tweets.order(:tweeted_at).limit(1).pluck(:tweet_id).first
    # where(:user_id => user.id).limit(1).first
    latest_tweet ? latest_tweet.tweet_id : 1
  end

  def self.store_tweets(user_id, tweets)
    tweets.each do |tweet|
      Tweet.create!(:tweeted_at => DateTime.parse(tweet.created_at.to_s),
                    :tweet_id   => tweet.id,
                    :text       => tweet.text,
                    :user_id    => user_id)
    end
  end
end
