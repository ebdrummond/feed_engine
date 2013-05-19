class InstagramJob
  @queue = :photo_queue

  def self.perform(params)
    InstagramService.retrieve_and_store_photos_for_user(params)
  end
end
