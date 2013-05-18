require 'spec_helper'

describe 'user posts note to trip' do
  context 'as a logged in user' do
    before(:all) do
      @user = User.create!(username: 'Sussy')
      login(@user)
    end

    context 'who is a traveler on the trip' do
      before(:all) do
        @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      end

      it 'can post a new note' do
        visit trip_path(@trip)
        fill_in 'note_text', :with => 'zomg, wiesn kicks ass this year!'
        click_button 'Post Note'
      end
    end

    context 'who is not traveler on the trip' do
      xit 'is not presented with an opportunity to post' do

      end
    end
  end
end
