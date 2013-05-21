require 'spec_helper'

describe FoursquareService do
  describe '.fetch_and_store_check_ins' do
    context 'with invalid token' do
      before(:all) do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'foursquare',
                                  :uid => 'abc123',
                                  :token => 'abc')
        @invalid_params = { 'user_id' => user.id, 'token' => 'abc' }
      end

      it 'throws an invalid or expired token' do
        VCR.use_cassette('foursquare_service_unauthenticated') do
          expect { FoursquareService.new(@invalid_params).fetch_and_store_check_ins}.
            to raise_error Foursquare2::APIError
        end
      end
    end

    context 'with a valid token' do
      before(:each) do
        @user = User.create!(username: 'Phil')
        @user.auth_sources.create!(:provider => 'foursquare',
                                   :uid => '55681009',
                                   :token => '3VEDNG1SWHWH2KRWYTSIIREMFFC2ZQG4BRSUXVXVEO4Q22OL')
        @valid_params = { 'user_id' => @user.id, 'token' => '3VEDNG1SWHWH2KRWYTSIIREMFFC2ZQG4BRSUXVXVEO4Q22OL' }
      end

      it 'retrieves photos from foursquare and saves them to the database' do
        VCR.use_cassette('foursquare_service_one_new_photo') do
          expect { FoursquareService.new(@valid_params).fetch_and_store_check_ins}.
            to change { CheckIn.count }.by 1
        end
      end

      it "only retrieves photos that don't exist in database yet" do
        VCR.use_cassette('foursquare_service_one_new_photo') do
          FoursquareService.new(@valid_params).fetch_and_store_check_ins
        end

        VCR.use_cassette('foursquare_service_no_new_photos') do
          expect { FoursquareService.new(@valid_params).fetch_and_store_check_ins }.
            to change { CheckIn.count }.by 0
        end
      end
    end
  end
end
