class FindOrCreateUser
  def self.from_auth_source(auth_hash)
    if auth_source = AuthSource.where(:uid => auth_hash['uid'],
                                      :provider => auth_hash['provider']).first
      auth_source.user
    else
      auth_params = AuthParams.new(auth_hash)
      create_user_and_auth_source(auth_params.auth_source_params, auth_params.user_params)
    end
  end

  private

  def self.create_user_and_auth_source(auth_source_params, user_params)
    User.transaction do
      user = create_with_username(user_params)
      user.auth_sources.create!(auth_source_params)
      user
    end
  end

  def self.create_with_username(params)
    i = 0
    begin
      i += 1
      User.create!({username: iterate_nickname(params['nickname'], i),
                    avatar: params['image_href']})
    rescue => e
      i == 10 ? raise(e) : retry
    end
  end

  def self.iterate_nickname(nickname, i)
    i == 1 ? nickname : "#{nickname}_#{i.to_s}"
  end
end
