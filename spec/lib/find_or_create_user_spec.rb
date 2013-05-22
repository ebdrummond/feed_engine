require 'spec_helper'

describe FindOrCreateUser do
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

  describe '.from_auth_source' do
    context 'with a known user' do
      before do
        @user = FindOrCreateUser.create_user_and_auth_source(twitter_auth_params, twitter_user_params)
      end

      it 'returns the user' do
        expect(FindOrCreateUser.from_auth_source(twitter_omniauth_params)).to eq @user
      end
    end

    context 'with a new user' do
      it 'creates a new user' do
        expect{ FindOrCreateUser.from_auth_source(twitter_omniauth_params) }.to change { User.count }.by 1
      end

      it 'creates and associates a new service object with that user' do
        expect{ FindOrCreateUser.from_auth_source(twitter_omniauth_params) }.to change { AuthSource.count }.by 1
      end
    end

    context 'with an existing username' do
      it 'creates a new user with an incremented username' do
        User.create!(:username => 'nick')
        user = FindOrCreateUser.from_auth_source(twitter_omniauth_params)
        expect(user.username).to eq 'nick_1'
      end
    end
  end
end
