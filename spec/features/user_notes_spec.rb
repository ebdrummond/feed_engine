require 'spec_helper'

describe 'user notes spec' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(:username => 'Sussy')
      login(@user)
    end

    context 'who is a traveler on the trip' do
      before(:each) do
        @trip = @user.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))

        @trip.save_with_user_trip
      end

      it 'can post a new note' do
        visit trip_path(@trip)
        fill_in 'note_text', :with => 'zomg, wiesn kicks ass this year!'
        expect { click_button 'Post Note' }.to change { @user.notes.count }.by 1
      end

      it 'can delete a new note' do
        note = @user.notes.build(:text => 'hello')
        note.trip = @trip
        note.save

        visit trip_path(@trip)
        expect { click_link 'Delete Note' }.to change { @user.notes.count }.by -1
      end
    end

    context 'who is not traveler on the trip' do
      before(:each) do
        user = User.create!(:username => 'Someone else')
        @trip = user.trips.new(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
        @trip.owner = user
        @trip.save
      end

      it 'is not presented with an opportunity to post' do
        visit trip_path(@trip)
        expect(page).to_not have_button 'Post Note'
      end
    end
  end
end
