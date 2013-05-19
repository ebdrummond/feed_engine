class FoursquareService
  def self.retrieve_and_store_check_ins_for_user(params)
    client = client_for_user(params['token'])
    check_ins = request_check_ins_for_user(client, params['uid'])

    store_check_ins(params['user_id'], check_ins)
  end

  private

  def self.client_for_user(token)
    Foursquare2::Client.new(:oauth_token => token)
  end

  def self.request_check_ins_for_user(client, uid)
    client.recent_checkins(:limit => 100)
  end

  def self.latest_check_in(user_id)
    user = User.find(user_id)
    user.check_ins.order("checked_in_at DESC").limit(1).pluck(:check_in_id).first
  end

  def self.store_check_ins(user_id, check_ins)
    check_ins.each do |check_in|
      CheckIn.create(:checked_in_at => Chronic.parse(check_in.createdAt),
                     :check_in_id => check_in.id,
                     :text => check_in.shout,
                     :location => check_in.venue.name,
                     :user_id => user_id)
    end
  end
end
