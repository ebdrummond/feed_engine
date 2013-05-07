require 'spec_helper'

describe SessionsController do
  describe 'GET #create' do
    it 'redirects to feeds#index' do
      get :create
      expect(response.status).to eq 302
    end
  end
end
