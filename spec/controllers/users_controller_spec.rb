require 'spec_helper'

describe UsersController do
  describe 'GET #account' do
    context 'as a logged in user' do
      it 'assigns the current user to a variable' do
        controller.stub(:current_user).and_return('a user')
        get :account
        expect(assigns(:user)).to eq 'a user'
      end
    end

    context 'as an unauthenticated user' do
      it 'redirects to root' do
        get :account
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    context 'as a logged in user' do
      before(:each) do
        @user = User.new(:username => 'rafiki')
        controller.stub(:current_user).and_return(@user)
      end

      context 'with valid params' do
        it 'updates the user and redirects to account' do
          put :update, { 'user' => {'username' => 'ebdrummond'} }
          expect(@user.username).to eq 'ebdrummond'
          expect(response).to redirect_to account_path
        end
      end

      context 'with invalid params' do
        it 'does not update the user and renders the account view' do
          put :update, { 'user' => {'username' => ''} }
          expect(response).to render_template(:account)
        end
      end
    end

    context 'as an unauthenticated user' do
      it 'redirects to root' do
        put :update
        expect(response).to redirect_to root_path
      end
    end
  end
end
