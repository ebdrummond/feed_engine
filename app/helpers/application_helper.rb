module ApplicationHelper
  include Twitter::Autolink

  def auth_source_image_file(type)
    {
      'tweet' => "twitter_logo.svg",
      'photo' => "instagram_logo.jpg",
      'check_in' => "foursquare_logo.jpg",
     }[type]
  end
end
