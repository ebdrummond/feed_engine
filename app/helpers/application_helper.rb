module ApplicationHelper
  def auth_source_image_file(type)
    {
      # 'tweet' => "twitter_logo.svg",
      # 'photo' => "instagram_logo.jpg",
      # 'check_in' => "foursquare_logo.jpg",
      'tweet' => "twitter-gray.png",
      'photo' => "instagram-128.png",
      'check_in' => "Foursquare-icon-gray.png",
      'note' => "pencil_64.png"
     }[type]
  end
end
