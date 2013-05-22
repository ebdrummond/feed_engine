require 'spec_helper'

describe AuthSourcesController do
  describe 'POST #create' do
    context 'happy path' do
      before do
        user = User.create!(:username => 'rafiki')
        controller.stub(:current_user).and_return(user)
        controller.stub(:auth_hash).and_return({
          'provider' => 'twitter',
          'credentials' => {'token' => '1234',
                            'secret' => '1234'},
          'uid' => 'abc123'
          })
      end

      it 'creates a new auth source' do
        expect{ post :create }.to change { AuthSource.count }.by 1
      end

      it 'redirects to the account path' do
        post :create
        expect(response).to redirect_to account_path
      end
    end

    context 'sad path' do
      context 'without a current user' do
        before do
          controller.stub(:auth_hash).and_return({
            'provider' => 'twitter',
            'credentials' => {'token' => '1234',
                              'secret' => '1234'},
            'uid' => 'abc123'
            })
        end

        it 'does not create an auth source' do
          post :create
          expect{ post :create }.to_not change { AuthSource.count }
        end

        it 'redirects to root' do
          post :create
          expect(response).to redirect_to root_path
        end
      end

      context 'with missing params' do
        before do
          user = User.create!(:username => 'rafiki')
          controller.stub(:current_user).and_return(user)
          controller.stub(:auth_hash).and_return({
            'credentials' => {'token' => '1234',
                              'secret' => '1234'},
            'uid' => 'abc123'
            })
        end

        it 'does not create an auth source' do
          post :create
          expect{ post :create }.to_not change { AuthSource.count }
        end

        it 'redirects to account path' do
          post :create
          expect(response).to redirect_to account_path
        end
      end

    end
  end

  describe 'DELETE #destroy' do

    context 'happy path' do
      before do
        @user = User.create!(:username => 'rafiki')
        @user.auth_sources.create!(:provider => 'twitter', :token => '123', :secret => '123', :uid => '123')
        controller.stub(:current_user).and_return(@user)
      end

      it 'deletes the auth source when found' do
        expect { delete :destroy, {:provider => 'twitter'} }.to change { @user.auth_sources.count }.by -1
      end

      it 'redirects to account path' do
        delete :destroy, {:provider => 'twitter'}
        expect(response).to redirect_to account_path
      end
    end

    context 'sad path' do
      context 'without a provider' do
        it 'raises an error' do
          user = User.create!(:username => 'rafiki')
          controller.stub(:current_user).and_return(user)
          expect { delete :destroy }.to raise_error
        end
      end

      context 'without a current user' do
        it 'redirects to root' do
          delete :destroy, {:provider => 'twitter'}
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
