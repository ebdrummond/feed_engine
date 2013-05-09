class CreateUser
  def self.from_unknown_auth_source(auth_hash)
    auth_source_params, user_params = parse_hash(auth_hash)

    auth_source = AuthSource.where(:uid => auth_source_params['uid'],
                    :provider => auth_source_params['provider']).first

    if auth_source
      auth_source.user
    else
      create_user_and_auth_source(auth_source_params, user_params)
    end
  end

private

  # TODO: HOLY CLEAN THIS SHIT UP
  def self.create_user_and_auth_source(auth_source_params, user_params)
    User.transaction do
      user = create_with_username(user_params)
      user.auth_sources.create!(auth_source_params)
      user
    end
  end

  # TODO: This is of the OAth domain (normalizing the oauth hash). Should it be moved elsewhere?
  def self.parse_hash(auth_hash)
    auth_source_params = {'provider' => auth_hash['provider'],
                          'token' => auth_hash['credentials']['token'],
                          'uid' => auth_hash['uid']}

    user_params = {'image_href' => auth_hash['info']['image']}

    case auth_source_params['provider']
    when 'twitter'
      auth_source_params.merge!('secret' => auth_hash['credentials']['secret'])
      user_params.merge!('nickname' => auth_hash['info']['nickname'])

      return auth_source_params, user_params
    when 'foursquare'
      user_params.merge!({'nickname' => auth_hash['info']['first_name'] +
                                       auth_hash['info']['last_name']})

      return auth_source_params, user_params
    else
      raise "Unrecognized OmniAuth provider: #{provider}"
    end
  end

  def self.create_with_username(params)
    i = 0
    begin
      i += 1
      User.create!({username: iterate_nickname(params['nickname'], i),
                    avatar: params['image_href']})
    rescue => e
      if i == 10
        raise e
      else
        retry
      end
    end
  end

  def self.iterate_nickname(nickname, i)
    i == 1 ? nickname : "#{nickname}_#{i.to_s}"
  end
end
