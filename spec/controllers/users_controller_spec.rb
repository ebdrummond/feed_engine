require 'spec_helper'

describe UsersController do
  describe 'GET #show' do
    context 'happy path' do
      before do
        @user = User.create!(:username => 'nas')
      end

      context 'as current user' do
        before do
          controller.stub(:current_user).and_return(@user)
        end

        it 'assigns user' do
          get :show, { :username => 'nas' }
          expect(assigns(:user)).to eq @user
        end

        it 'assigns trips' do
          UserShow.should_receive(:new)
          get :show, { :username => 'nas' }
        end
      end

      context 'as not the current user' do
        it 'assigns user' do
          get :show, { :username => 'nas' }
          expect(assigns(:user)).to eq @user
        end

        it 'assigns trips' do
          UserShow.should_receive(:new)
          get :show, { :username => 'nas' }
        end
      end
    end

    context 'sad path' do
      it 'throws error when user not found' do
        expect { get :show }.to raise_error
      end
    end
  end

  describe 'GET #account' do
    context 'as a logged in user' do
      it 'assigns the current user' do
        user = User.create!(:username => 'soda')
        controller.stub(:current_user).and_return(user)
        get :account
        expect(assigns(:user)).to eq user
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

  describe 'DELETE #destroy' do
    before do
      user = User.create!(:username => "Alicia")
      controller.stub(:current_user).and_return(user)
    end

    it 'deletes the current user' do
      expect { delete :destroy }.to change { User.count }.by -1
    end

    it 'logs out the user' do
      controller.should_receive(:logout)
      delete :destroy
    end

    it 'redirects to root' do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end
