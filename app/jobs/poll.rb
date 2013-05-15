class Poll
  @queue = :poll_queue

  def self.perform
    TwitterService.update
  end
end
