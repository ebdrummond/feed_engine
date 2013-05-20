class AuthParams
  attr_reader :auth_hash

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def auth_source_params
    {}.tap do |params|
      params['provider'] = auth_hash['provider']
      params['token']    = auth_hash['credentials']['token']
      params['uid']      = auth_hash['uid']

      if auth_hash['provider'] == 'twitter'
        params['secret'] = auth_hash['credentials']['secret']
      end
    end
  end

  def user_params
    {'image_href' => auth_hash['info']['image'],
     'nickname' => auth_hash['info']['nickname']}
  end
end
