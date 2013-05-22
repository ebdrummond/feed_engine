require 'spec_helper'

describe SessionsController do
  describe 'GET #create' do
    context 'happy path' do
      before do
        @user = User.create(:username => 'Kyle')
        FindOrCreateUser.stub(:from_auth_source).and_return(@user)
      end

      it 'hits CreateUser.from_auth_source with auth_source return value' do
        auth_hash = mock("oh, hai!")
        controller.stub(:auth_hash).and_return(auth_hash)
        FindOrCreateUser.should_receive(:from_auth_source).with(auth_hash)
        get :create
      end

      it 'logs in the user' do
        get :create
        expect(controller.current_user).to eq @user
      end

      it 'assigns an api key to the user' do
        get :create
        expect { get :create }.to change { ApiKey.where(:user_id => @user.id).count }.by 1
      end

      it 'redirects dashboard path' do
        get :create
        expect(response).to redirect_to dashboard_path
      end
    end

    context 'sad path' do
      before do
        FindOrCreateUser.stub(:from_auth_source).and_return(User.new)
      end

      it 'redirects to root' do
        get :create
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #error' do
    it 'redirects to root' do
      get :error
      expect(page).to redirect_to(root_path)
    end
  end
end
