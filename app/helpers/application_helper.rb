module ApplicationHelper
  include Twitter::Autolink

  def auth_source_image_file(type)
    {
      'tweet' => "twitter-gray.png",
      'photo' => "instagram-128.png",
      'check_in' => "Foursquare-icon-gray.png",
      'note' => "pencil_64.png"
     }[type]
  end
end
