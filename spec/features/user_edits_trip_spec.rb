require 'spec_helper'

describe 'User edit trip' do
  context 'after logging in' do
    before do
      user = User.create!(username: 'nick')
      login(user)
      @trip = user.trips.create(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    it 'updates the trip with valid parameters' do
      visit edit_trip_path(@trip)
      fill_in 'trip[name]', with: "edited trip"
      fill_in 'trip[destination]', with: 'Sau Paulo, Brazil'
      fill_in 'trip[start]', with: '2013-07-15'
      fill_in 'trip[end]', with: '2013-07-22'

      click_button 'submit'
      @trip.reload
      expect(current_path).to eq trip_path(@trip)
      expect(@trip.name).to eq 'edited trip'
    end

    it 'does not update the trip with invalid parameters' do
      visit edit_trip_path(@trip)
      fill_in 'trip[name]', with: "edited trip"
      fill_in 'trip[destination]', with: nil
      fill_in 'trip[start]', with: '2013-07-15'
      fill_in 'trip[end]', with: '2013-07-22'

      click_button 'submit'
      expect(page).to have_content "Destination can't be blank"
    end
  end
end
