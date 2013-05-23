require 'spec_helper'

describe 'Trip owner adds traveler' do
  context 'after logging in' do
    before do
      user = User.create!(username: 'nick')
      user2 = User.create!(username: 'erin')
      login(user)
      @trip = user.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      @trip.save_with_user_trip
    end

    context "the new traveler doesn't exist" do
      it "does not add the traveler to the trip" do
        visit edit_trip_path(@trip)

        fill_in 'username', with: "eebee"
        click_button("Add Traveler")
        expect(page).to have_content("Username not found!")
      end
    end

    context "the new traveler is already on the trip" do
      it "does not add a the traveler to the trip" do
        visit edit_trip_path(@trip)

        fill_in 'username', with: "nick"
        click_button("Add Traveler")
        expect(page).to have_content("Already on trip!")
      end
    end

    context "the new traveler exists and is not on the trip" do
      it "adds the traveler to the trip" do
        visit edit_trip_path(@trip)

        fill_in 'username', with: "raph"
        click_button("Add Traveler")
        expect(page).to have_content("Username not found!")
      end
    end
  end
end
