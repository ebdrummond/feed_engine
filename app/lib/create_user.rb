class CreateUser
  def self.from_unknown_auth_source(auth_hash)
    normalized_hash = parse_hash(auth_hash)
    auth_source = AuthSource.where(:uid => normalized_hash[:uid], :provider => normalized_hash[:provider]).first

    if auth_source
      User.find(auth_source.user_id)
    else
      create_with_provider_transaction(normalized_hash)
    end
  end

  def self.create_with_provider_transaction(args)
    nickname = args[:nickname]

    User.transaction do
      user = create_with_username(nickname)
      user.auth_sources.create!(args)
      user
    end
  end

private

  def self.parse_hash(auth_hash)
    {:provider => auth_hash[:provider],
     :token => auth_hash[:credentials][:token],
     :secret => auth_hash[:credentials][:secret],
     :nickname => auth_hash[:info][:nickname],
     :uid => auth_hash[:uid]}
  end

  def self.create_with_username(nickname)
    i = 0
    begin
      i += 1
      User.create!({username: iterate_nickname(nickname, i)})
    rescue
      retry
    end
  end

  def self.iterate_nickname(nickname, i)
    i == 1 ? nickname : "#{nickname}_#{i.to_s}"
  end
end
