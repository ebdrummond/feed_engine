class InstagramJob
  @queue = :photo_queue

  def self.perform(params)
    InstagramService.new(params).fetch_and_store_photos
  end
end
