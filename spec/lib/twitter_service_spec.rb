require 'spec_helper'

describe TwitterService do
  describe '.update' do
    context 'with invalid token/secret' do
      it 'throws an invalid or expired token' do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'twitter',
                                  :uid => 'abc123',
                                  :token => 'abc',
                                  :secret => '123')

        expect { TwitterService.update }.to raise_error Twitter::Error::Unauthorized
      end
    end

    context 'with a valid token/secret' do
      before(:each) do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'twitter',
                                  :uid => 'abc123',
                                  :token => '57272421-DdrlGSaASFZj1qjoqYqiSo4YDmJkDkaZOBVE5rSV4',
                                  :secret => 'INXG4Rg7mgtTr2oZQhgjf6O9UJPSPqtv4HbFWsnMg')
      end

      it 'retrieves tweets from twitter and saves them to the database' do
        expect { TwitterService.update }.to change { Tweet.count }.by 1
      end

      it "only retrieves tweets that don't exist in database yet" do
        TwitterService.update
        expect { TwitterService.update }.to change { Tweet.count }.by 0
      end
    end
  end
end
