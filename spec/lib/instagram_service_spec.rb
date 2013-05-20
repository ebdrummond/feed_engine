require 'spec_helper'

describe InstagramService do
  describe '.fetch_and_store_photos' do
    context 'with invalid token' do
      before(:all) do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'instagram',
                                  :uid => 'abc123',
                                  :token => 'abc')
        @invalid_params = { 'user_id' => user.id, 'token' => 'abc' }
      end

      it 'throws an invalid or expired token' do
        VCR.use_cassette('instagram_service_unauthenticated') do
          expect { InstagramService.new(@invalid_params).fetch_and_store_photos}.
            to raise_error Instagram::BadRequest
        end
      end
    end

    context 'with a valid token' do
      before(:each) do
        @user = User.create!(username: 'Phil')
        @user.auth_sources.create!(:provider => 'instagram',
                                   :uid => 'abc123',
                                   :token => '31057733.9fa6817.f1d1b003d3424e6088ceee87836b9960')
        @valid_params = { 'user_id' => @user.id, 'token' => '31057733.9fa6817.f1d1b003d3424e6088ceee87836b9960' }
      end

      it 'retrieves photos from instagram and saves them to the database' do
        VCR.use_cassette('instagram_service_one_new_photo') do
          expect { InstagramService.new(@valid_params).fetch_and_store_photos}.
            to change { Photo.count }.by 3
        end
      end

      it "only retrieves photo that don't exist in database yet" do
        VCR.use_cassette('instagram_service_one_new_photo') do
          InstagramService.new(@valid_params).fetch_and_store_photos
        end

        VCR.use_cassette('instagram_service_no_new_photos') do
          expect { InstagramService.new(@valid_params).fetch_and_store_photos }.
            to change { Photo.count }.by 0
        end
      end
    end
  end
end
