require 'spec_helper'

describe 'user posts note to trip' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(:username => 'Sussy')
      login(@user)
    end

    context 'who is a traveler on the trip' do
      before(:each) do
        @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      end

      it 'can post a new note' do
        visit trip_path(@trip)
        fill_in 'note_text', :with => 'zomg, wiesn kicks ass this year!'
        expect { click_button 'Post Note' }.to change { @user.notes.count }.by 1
      end
    end

    context 'who is not traveler on the trip' do
      before(:each) do
        user = User.create!(:username => 'Someone else')
        @trip = user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      end

      it 'is not presented with an opportunity to post' do
        visit trip_path(@trip)
        expect(page).to_not have_button 'Post Note'
      end
    end
  end
end
