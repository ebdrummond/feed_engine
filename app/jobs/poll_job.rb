class PollJob
  @queue = :poll_queue

  def self.perform
    poll_services(AuthSource.grouped_by_provider)
  end

  private

  def self.poll_services(auth_sources_by_provider)
    auth_sources_by_provider.each do |provider, auth_sources|
      job = job_for_provider(provider)
      poll_service(job, auth_sources)
    end
  end

  def self.poll_service(job, auth_sources)
    auth_sources.each do |auth_source|
      Resque.enqueue(job, PollParams.new(auth_source).params)
    end
  end

  def self.job_for_provider(provider)
    "#{provider}_job".classify.contantize
  end
end
