require 'spec_helper'

describe TwitterService do
  describe '.retrieve_and_store_tweets_for_user' do
    context 'with invalid token/secret' do
      before(:all) do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'twitter',
                                  :uid => 'abc123',
                                  :token => 'abc',
                                  :secret => '123')
        @invalid_params = {'user_id' => user.id, 'token' => 'abc', 'secret' => '123'}
      end

      it 'throws an invalid or expired token' do
        VCR.use_cassette('twitter_service_unauthenticated') do
          expect { TwitterService.new(@invalid_params).fetch_and_store_tweets}.
            to raise_error Twitter::Error::Unauthorized
        end
      end
    end

    context 'with a valid token/secret' do
      before(:each) do
        @user = User.create!(username: 'Phil')
        @user.auth_sources.create!(:provider => 'twitter',
                                   :uid => 'abc123',
                                   :token => '57272421-DdrlGSaASFZj1qjoqYqiSo4YDmJkDkaZOBVE5rSV4',
                                   :secret => 'INXG4Rg7mgtTr2oZQhgjf6O9UJPSPqtv4HbFWsnMg')
        @valid_params = { 'user_id' => @user.id,
                          'token' => '57272421-DdrlGSaASFZj1qjoqYqiSo4YDmJkDkaZOBVE5rSV4',
                          'secret' => 'INXG4Rg7mgtTr2oZQhgjf6O9UJPSPqtv4HbFWsnMg' }
      end

      let(:retrieve_and_store_tweets_for_user) do
        TwitterService.new(@valid_params).fetch_and_store_tweets
      end

      it 'retrieves tweets from twitter and saves them to the database' do
        VCR.use_cassette('twitter_service_one_new_tweet') do
          expect { TwitterService.new(@valid_params).fetch_and_store_tweets }.
            to change { Tweet.count }.by 9
        end
      end

      it "only retrieves tweets that don't exist in database yet" do
        VCR.use_cassette('twitter_service_one_new_tweet') do
          TwitterService.new(@valid_params).fetch_and_store_tweets
        end

        VCR.use_cassette('twitter_service_no_new_tweets') do
          expect { TwitterService.new(@valid_params).fetch_and_store_tweets }.
            to change { Tweet.count }.by 0
        end
      end
    end
  end
end
