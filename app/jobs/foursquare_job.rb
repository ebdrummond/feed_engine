class FoursquareJob
  @queue = :foursquare_queue

  def self.perform(params)
    FoursquareService.retrieve_and_store_check_ins_for_user(params)
  end
end