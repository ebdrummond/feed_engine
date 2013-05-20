class PollParams
  attr_reader :auth_source

  def initialize(auth_source)
    @auth_source = auth_source
  end

  def params
    case auth_source.provider
    when 'twitter'
      { 'token' => auth_source.token, 'secret' => auth_source.secret, 'user_id' => auth_source.user_id }
    when 'foursquare', 'instagram'
      { 'token' => auth_source.token, 'user_id' => auth_source.user_id, 'uid' => auth_source.uid }
    end
  end
end
