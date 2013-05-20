class InstagramService
  attr_reader :client, :user, :uid

  def initialize(params)
    @client = self.class.client_for_user(params['token'])
    @user = User.find(params['user_id'])
    @uid = params['uid']
  end

  def fetch_and_store_photos
    fetch_photos.each do |photo|
      store_photo(photo)
    end
  end

  private

  def fetch_photos
    client.user_recent_media(uid, {:count => 200})
  end

  def latest_photo_id
    user.photos.order("taken_at DESC").limit(1).pluck(:photo_id).first
  end

  def store_photo(photo)
    caption = photo.caption.text if photo.caption
    Photo.create(:taken_at => Time.at(photo.created_time.to_i),
                 :photo_id => photo.id,
                 :url      => photo.images.standard_resolution.url,
                 :caption  => caption,
                 :user_id  => user.id)
  end

  def self.client_for_user(token)
    Instagram.client(:access_token => token)
  end
end
