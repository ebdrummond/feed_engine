class TwitterService
  def self.update
    accounts = AuthSource.where(provider: 'twitter').all
    accounts.each do |account|
      client = client_for_user(account.token, account.secret)
      tweets = tweets_for_user(client, account.user_id)

      store_tweets(account.user_id, tweets)
    end
  end

private

  def self.client_for_user(token, secret)
    Twitter::Client.new(:oauth_token => token,
                        :oauth_token_secret => secret,
                        :consumer_key => ENV['TWITTER_KEY'],
                        :consumer_secret => ENV['TWITTER_SECRET'])
  end

  def self.tweets_for_user(client, user_id)
    client.user_timeline(:count => 200,
                         :since_id => latest_id(user_id),
                         :trim_user => true,
                         :exclude_replies => true)
  end

  def self.latest_id(user_id)
    latest_tweet = Tweet.where(user_id: user_id).first
    latest_tweet ? latest_tweet.twitter_id : 1
  end

  def self.store_tweets(user_id, tweets)
    tweets.each do |tweet|
      Tweet.create(:created_at => Date.parse(tweet[:created_at]),
                   :twitter_id => tweet[:id_str],
                   :text => tweet[:text],
                   :user_id => tweet[:user][:id_str])
    end
  end
end
