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
    user = User.new({username: params['nickname'],
                     avatar: params['image_href']})
    i = 0
    begin
      user.save!
      user
    rescue
      i += 1
      user.username = "#{params['nickname']}_#{i.to_s}"
      retry
    end
  end
end
