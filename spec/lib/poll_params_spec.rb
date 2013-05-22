require 'spec_helper'

describe PollParams do
  before do
    @user = User.create!(:username => "philly")
  end

  describe '.params' do
    it 'passes back the correct correct params for twitter' do
      auth_source = @user.auth_sources.create!(:token => '123', :secret => '456', :uid => '12', :provider => 'twitter')
      poll_params = PollParams.new(auth_source)

      expect(poll_params.params.keys).to eq ['token', 'secret', 'user_id']
    end

    it 'passes back the correct correct params for instagram' do
      auth_source = @user.auth_sources.create!(:token => '123', :secret => '456', :uid => '12', :provider => 'instagram')
      poll_params = PollParams.new(auth_source)

      expect(poll_params.params.keys).to eq ['token', 'user_id', 'uid']
    end

    it 'passes back the correct correct params for foursquare' do
      auth_source = @user.auth_sources.create!(:token => '123', :secret => '456', :uid => '12', :provider => 'foursquare')
      poll_params = PollParams.new(auth_source)

      expect(poll_params.params.keys).to eq ['token', 'user_id', 'uid']
    end
  end
end
