class AuthParams
  attr_reader :auth_hash

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def auth_source_params
    auth_source_params = {'provider' => auth_hash['provider'],
                          'token' => auth_hash['credentials']['token'],
                          'uid' => auth_hash['uid']}

    if auth_hash['provider'] == 'twitter'
      auth_source_params.merge!('secret' => auth_hash['credentials']['secret'])
    end

    auth_source_params
  end

  def user_params
    {'image_href' => auth_hash['info']['image'],
     'nickname' => auth_hash['info']['nickname']}
  end
end
