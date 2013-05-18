class Authentication

  def self.parse_hash(auth_hash)
    case auth_hash['provider']
    when 'twitter'
      parse_twitter(auth_hash)
    when 'instagram'
      parse_secondary_service(auth_hash)
    when 'foursquare'
      parse_secondary_service(auth_hash)
    else
      raise "Unrecognized OmniAuth provider: #{provider}"
    end
  end

  def self.parse_twitter(auth_hash)
    auth_source_params = {'provider' => auth_hash['provider'],
                          'token' => auth_hash['credentials']['token'],
                          'uid' => auth_hash['uid']}

    user_params = {'image_href' => auth_hash['info']['image']}

    auth_source_params.merge!('secret' => auth_hash['credentials']['secret'])
    user_params.merge!('nickname' => auth_hash['info']['nickname'])

    return auth_source_params, user_params
  end

  def self.parse_secondary_service(auth_hash)
    auth_source_params = {'provider' => auth_hash['provider'],
                          'token' => auth_hash['credentials']['token'],
                          'uid' => auth_hash['uid']}
    link_service_to_user(auth_source_params)
  end

  def self.link_service_to_user(auth_source_params)
    AuthSource.new(auth_source_params)
  end
end