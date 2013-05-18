module AuthenticationForFeatureRequest
  def login(user)
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        :provider => 'twitter',
        :credentials => { :token => '123', :secret => 'abc' },
        :info => { :nickname => user.username },
        :uid => 'abc123'
      })

      user.auth_sources.create!(provider: 'twitter', token: 'abc', secret: '123', uid: 'abc123')

      page.driver.get '/auth/twitter/callback'
  end
end
