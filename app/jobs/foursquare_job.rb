class FoursquareJob
  @queue = :foursquare_queue

  def self.perform(params)
    FoursquareService.new(params).fetch_and_store_check_ins
  end
end
