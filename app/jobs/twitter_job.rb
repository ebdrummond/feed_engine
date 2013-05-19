class TwitterJob
  @queue = :tweet_queue

  def self.perform(params)
    TwitterService.new(params).fetch_and_store_tweets
  end
end
