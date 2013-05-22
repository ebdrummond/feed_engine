class FoursquareService
  attr_reader :client, :user, :uid

  def initialize(params)
    @client = self.class.client_for_user(params['token'])
    @user = User.find(params['user_id'])
    @uid = params['uid']
  end

  def fetch_and_store_check_ins
    fetch_check_ins.each do |check_in|
      store_check_in(check_in)
    end
  end

  private

  def fetch_check_ins
    client.recent_checkins(:afterTimestamp => latest_check_in_timestamp.to_i, :limit => 100)
  end

  def latest_check_in_timestamp
    user.check_ins.order("checked_in_at DESC").limit(1).pluck(:checked_in_at).first || 1
  end

  def store_check_in(check_in)
    CheckIn.create(:checked_in_at => Time.at(check_in.createdAt),
                   :check_in_id => check_in.id,
                   :text => check_in.shout,
                   :venue => check_in.venue.name,
                   :location => check_in.venue.location,
                   :short_url => check_in.venue.shortUrl,
                   :user_id => user.id)
  end

  def self.client_for_user(token)
    Foursquare2::Client.new(:oauth_token => token)
  end
end
