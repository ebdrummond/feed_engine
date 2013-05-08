require 'spec_helper'

describe FeedsController do
  describe 'GET #index' do
    context 'when logged in' do
      xit 'does something' do
      end
    end

    context 'when not logged in' do
      it 'redirects to root' do
        get :index
        expect(page).to redirect_to root_path
      end
    end
  end
end
