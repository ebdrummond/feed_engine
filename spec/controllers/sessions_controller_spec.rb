require 'spec_helper'

describe SessionsController do
  describe 'GET #create' do

    it 'hits CreateUser.from_unknown_auth_source' do
      pending 'how do we hit this?'
    end

    it 'logs in the user and redirects to dashboard' do
      pending 'how do we hit this?'
    end

    it 'redirects to root if user returned is invalid' do
      pending 'how do we hit this?'
    end
  end

  describe 'GET #error' do
    it 'redirects to root' do
      get :error
      expect(page).to redirect_to(root_path)
    end
  end
end
