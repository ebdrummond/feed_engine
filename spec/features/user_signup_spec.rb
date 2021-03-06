require 'spec_helper'

describe 'User signup' do
  let(:valid_twitter_credentials) do
    OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :credentials => { :token => '123', :secret => 'abc' },
      :info => { :nickname => 'nick' },
      :uid => 'abc123'
    })
  end

  describe 'clicking Login with Twitter' do
    it 'as an existing user, redirects to dashboard' do
      OmniAuth.config.mock_auth[:twitter] = valid_twitter_credentials

      user = User.create!(username: 'nick')
      user.auth_sources.create!(provider: 'twitter', token: 'abc', secret: '123', uid: 'abc123')

      visit root_path
      click_link 'Login with Twitter'
      expect(current_path).to eq dashboard_path
    end

    it 'redirects to failure path with invalid credentials' do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials

      visit root_path
      click_link_or_button 'Login with Twitter'
      expect(current_path).to eq root_path
    end
  end
end
