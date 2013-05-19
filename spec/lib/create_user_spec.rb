require 'spec_helper'

describe CreateUser do
  let(:twitter_omniauth_params) do
    { 'provider'    => 'twitter',
      'credentials' => { 'token' => '123',
                         'secret' => 'abc' },
      'info' => { 'nickname' => 'nick',
                  'image'    => 'http://blah.com' },
      'uid'  => 'abc123' }
  end

  let(:foursquare_omniauth_params) do
    { 'provider'    => 'foursquare',
      'credentials' => { 'token' => '123' },
      'info'        => { 'first_name' => 'Winston',
                         'last_name'  => 'Churchill',
                         'image'      => 'http://blah.com' },
      'uid'         => 'abc123' }
  end

  let(:twitter_auth_params) do
    { 'provider' => 'twitter',
      'token'    => '123',
      'secret'   => 'abc',
      'uid'      => 'abc123' }
  end

  let(:twitter_user_params) do
    { 'nickname'   => 'nick',
      'image_href' => 'http://blah.com' }
  end

  let(:foursquare_auth_params) do
    { 'provider' => 'foursquare',
      'token'    => '123',
      'uid'      => 'abc123' }
  end

  let(:foursquare_user_params) do
    { 'nickname'   => 'WinstonChurchill',
      'image_href' => 'http://blah.com' }
  end

  context 'normalizes the auth_hash' do
    it 'for twitter' do
      expect(Authentication.parse_hash(twitter_omniauth_params)).to eq [twitter_auth_params, twitter_user_params]
    end
  end

  it '.create_user_and_auth_source creates a user' do
    expect{ CreateUser.create_user_and_auth_source(twitter_auth_params, twitter_user_params) }.to change { User.count }.by 1
    expect{ CreateUser.create_user_and_auth_source(twitter_auth_params, twitter_user_params) }.to change { AuthSource.count }.by 1
  end

  context '.from_unknown_auth_source with a known user' do
    before do
      @user = CreateUser.create_user_and_auth_source(twitter_auth_params, twitter_user_params)
    end

    it 'returns the user' do
      expect(CreateUser.from_unknown_auth_source(twitter_omniauth_params)).to eq @user
    end
  end

  context '.from_unknown_auth_source with a new user' do
    it 'creates a new user' do
      expect{ CreateUser.from_unknown_auth_source(twitter_omniauth_params) }.to change { User.count }.by 1
    end

    it 'creates and associates a new service object with that user' do
      expect{ CreateUser.from_unknown_auth_source(twitter_omniauth_params) }.to change { AuthSource.count }.by 1
    end
  end
end
