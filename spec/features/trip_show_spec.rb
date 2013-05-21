require 'spec_helper'

describe 'User visits a trip show page' do
  context 'after logging in' do
    before(:all) do
      user = User.create!(username: 'nick')
      user2 = User.create!(username: 'kyle')
      login(user)
      @trip = user2.trip.create(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    context "with a public trip" do
      it "takes the user to the trip show page" do
        expect(current_path).to eq trip_path(@trip)
      end
    end
  end
end
