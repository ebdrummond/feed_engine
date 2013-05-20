require 'spec_helper'

describe Api::V1::FeedsController do
  describe 'GET #show' do
    before do
      @user = User.create!(:username => "T-rex")
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    it 'returns json as default' do
      get :show, { :id => @trip.id }
      expect(response).to eq []
    end
  end
end
