require 'spec_helper'

describe 'Owner destroys a trip' do
  context 'after logging in' do
    before do
      user = User.create!(username: 'nick')
      login(user)

      @trip = user.trips.create(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    it "the owner destroys the trip" do
      visit edit_trip_path(@trip)
      click_button("Delete trip")
      expect(page).to have_content("Trip deleted!")
    end
  end
end
