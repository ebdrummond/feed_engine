class PollJob
  @queue = :poll_queue

  def self.perform
    accounts_by_provider = AuthSource.accounts_by_provider

    poll_tweets(accounts_by_provider['twitter'] || [])
    # poll_photos(accounts_by_provider['instagram'] || [])
    # poll_checkins(accounts_by_provider['foursquare'] || [])
  end

private

  def self.poll_tweets(twitter_accounts)
    twitter_accounts.each do |twitter_account|
      Resque.enqueue(TwitterJob, { :token => twitter_account.token,
                                   :secret => twitter_account.secret,
                                   :user_id => twitter_account.user_id })
    end
  end
end
