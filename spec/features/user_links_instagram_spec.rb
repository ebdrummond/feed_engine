require 'spec_helper'

describe "Linking Instagram" do
  
  let(:valid_twitter_credentials) do
    OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :credentials => { :token => '123', :secret => 'abc' },
      :info => { :nickname => 'nick' },
      :uid => 'abc123'
    })
  end

  it "connects to an instagram account" do
    OmniAuth.config.mock_auth[:twitter] = valid_twitter_credentials

    user = User.create!(username: 'nick')
    user.auth_sources.create!(provider: 'twitter', token: 'abc', secret: '123', uid: 'abc123')

    visit account_settings_path
    click_link "Connect"
    expect(page).to have_content("Instagram account connected!")
  end
end