class InstagramService
  def self.retrieve_and_store_photos_for_user(params)
    client = client_for_user(params['token'])
    photos = request_photos_for_user(client, params['uid'])

    store_photos(params['user_id'], photos)
  end

private

  def self.client_for_user(token)
    Instagram.client(:access_token => token)
  end

  def self.request_photos_for_user(client, uid)
    client.user_recent_media(uid, {:count => 200})
  end

  def self.latest_photo_id(user_id)
    user = User.find(user_id)
    user.photos.order("taken_at DESC").limit(1).pluck(:photo_id).first
  end

  def self.store_photos(user_id, photos)
    photos.each do |photo|
      Photo.create(:taken_at => Time.at(photo.caption.created_time.to_i),
                   :photo_id => photo.id,
                   :url      => photo.images.standard_resolution.url,
                   :caption  => photo.caption.text,
                   :user_id  => user_id)
    end
  end
end