class TwitterJob
  @queue = :tweet_queue

  def self.perform(params)
    TwitterService.retrieve_and_store_tweets_for_user(params)
  end
end
