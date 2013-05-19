class PollJob
  @queue = :poll_queue

  def self.perform
    auth_sources_by_provider = AuthSource.all_by_provider

    auth_sources_by_provider.keys.each do |provider|
      poll_services(auth_sources_by_provider[provider])
    end
  end

  private

  def self.poll_service(auth_sources = [])
    auth_sources.each do |auth_source|
      Resque.enqueue(poll_class_for_provider(auth_source.provider),
        auth_source.poll_params)
    end
  end

  def self.poll_class_for_provider(provider)
    "#{provider}_job".classify.contantize
  end
end
