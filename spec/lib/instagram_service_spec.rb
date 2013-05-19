require 'spec_helper'

describe InstagramService do
  describe '.retrieve_and_store_photos_for_user' do
    context 'with invalid token' do
      it 'throws an invalid or expired token' do
        user = User.create!(username: 'Phil')
        user.auth_sources.create!(:provider => 'instagram',
                                  :uid => 'abc123',
                                  :token => 'abc')
        VCR.use_cassette('instagram_service_unauthenticated') do
          expect {
            InstagramService.retrieve_and_store_photos_for_user('user_id' => user.id,
                                                                'token' => 'abc')
            }.to raise_error Instagram::BadRequest
        end
      end
    end

    context 'with a valid token' do
      before(:each) do
        @user = User.create!(username: 'Phil')
        @user.auth_sources.create!(:provider => 'instagram',
                                   :uid => 'abc123',
                                   :token => '31057733.9fa6817.f1d1b003d3424e6088ceee87836b9960')
      end

      let(:retrieve_and_store_photos_for_user) do
        InstagramService.retrieve_and_store_photos_for_user('user_id' => @user.id,
                                                            'token' => '31057733.9fa6817.f1d1b003d3424e6088ceee87836b9960')
      end

      it 'retrieves photos from instagram and saves them to the database' do
        VCR.use_cassette('instagram_service_one_new_photo') do
          expect { retrieve_and_store_photos_for_user }.to change { Photo.count }.by 3
        end
      end

      it "only retrieves tweets that don't exist in database yet" do
        VCR.use_cassette('instagram_service_one_new_tweet') do
          retrieve_and_store_photos_for_user
        end

        VCR.use_cassette('instagram_service_no_new_photos') do
          expect { retrieve_and_store_photos_for_user }.to change { Photo.count }.by 0
        end
      end
    end
  end
end
