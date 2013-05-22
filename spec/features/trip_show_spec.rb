require 'spec_helper'

describe 'User visits a trip show page' do
  context 'after logging in' do
    before do
      user = User.create!(username: 'nick')
      @user2 = User.create!(username: 'kyle')
      login(user)
      @trip = @user2.trips.create(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    context "with a public trip" do
      it "takes the user to the trip show page" do
        visit trip_path(@trip)
        expect(page).to have_content("Phil's Getaway")
      end
    end

    context "with a private trip" do
      it "takes the user to an error page" do
        @trip.visible = true
        @trip.save
        visit trip_path(@trip)
        expect(page).to have_content("Oh noes!")
      end
    end
  end
end
