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

  let(:valid_instagram_credentials) do
    OmniAuth::AuthHash.new({
      :provider => "instagram",
      :credentials => { :token => "123" },
      :uid => "1234"
    })
  end

  let(:valid_foursquare_credentials) do
    OmniAuth::AuthHash.new({
      :provider => "foursquare",
      :credentials => { :token => "123" },
      :uid => "1234"
    })
  end

  before do
    OmniAuth.config.mock_auth[:twitter] = valid_twitter_credentials
    OmniAuth.config.mock_auth[:instagram] = valid_instagram_credentials
    OmniAuth.config.mock_auth[:foursquare] = valid_foursquare_credentials

    user = User.create!(username: 'nick')
    user.auth_sources.create!(provider: 'twitter', token: 'abc', secret: '123', uid: 'abc123')
    visit root_path
    click_link "Login with Twitter"
    visit account_settings_path
  end

  it "connects to an instagram account" do
    click_link "connect-instagram"
    expect(page).to have_content("Instagram account connected!")
  end

  it "connects to a foursquare account" do
    click_link "connect-foursquare"
    expect(page).to have_content("Foursquare account connected!")
  end
end