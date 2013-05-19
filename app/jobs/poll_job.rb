class PollJob
  @queue = :poll_queue

  def self.perform
    accounts_by_provider = AuthSource.accounts_by_provider

    poll_tweets(accounts_by_provider['twitter'] || [])
    poll_photos(accounts_by_provider['instagram'] || [])
    poll_check_ins(accounts_by_provider['foursquare'] || [])
  end

private

  def self.poll_tweets(twitter_accounts)
    twitter_accounts.each do |twitter_account|
      Resque.enqueue(TwitterJob, { 'token' => twitter_accounts.token,
                                   'secret' => twitter_account.secret,
                                   'user_id' => twitter_account.user_id })
    end
  end

  def self.poll_photos(instagram_accounts)
    instagram_accounts.each do |instagram_account|
      Resque.enqueue(InstagramJob, { 'token' => instagram_account.token,
                                     'user_id' => instagram_account.user_id,
                                     'uid' => instagram_account.uid })
    end
  end

  def self.poll_check_ins(foursquare_accounts)
    foursquare_accounts.each do |foursquare_account|
      Resque.enqueue(FoursquareJob, { 'token' => foursquare_account.token,
                                      'user_id' => foursquare_account.user_id,
                                      'uid' => foursquare_account.uid })
    end
  end
end
