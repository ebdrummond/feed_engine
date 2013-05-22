require 'spec_helper'

describe UserTripsController do
  before do
    request.env["HTTP_REFERER"] = root_path
  end

  describe 'POST #create' do
    it 'validates the user exists' do
      User.should_receive(:find_by_username)
      post :create, { :id => 1 }
    end

    context 'happy path' do
      before do
        owner = User.create!(:username => "rafi")
        @trip = owner.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
        @user = User.create!(:username => "erin")

        User.stub(:find_by_username).and_return(@user)
      end

      it 'creates a new user trips traveler entry' do
        expect do
          post :create, { :id => @trip.id, :trip_role => 'traveler' }
        end.to change { @user.my_trips.count }.by 1

        expect(UserTrip.first.trip_role).to eq 'traveler'
      end

      it 'creates a new user trips kreepr entry' do
        expect do
          post :create, { :id => @trip.id, :trip_role => 'kreepr' }
        end.to change { @user.my_trips.count }.by 1

        expect(UserTrip.first.trip_role).to eq 'kreepr'
      end
    end

    context 'sad path' do
      context 'with an unknown username' do
        it 'does not create a new entry and redirects back' do
          post :create, { :id => 1 }
          expect(UserTrip.count).to eq 0
          expect(response).to redirect_to root_path
        end
      end

      context 'user is already on that trip' do
        before do
          owner = User.create!(:username => "Drummy")
          trip = owner.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))

          user = User.create!(:username => "Sussy")
          user.user_trips.create!(:trip_id => trip.id, :trip_role => 'traveler')
        end

        it 'does not create a new entry' do
          expect { post :create, { :id => 1 } }.to_not change { UserTrip.count }
        end

        it 'redirects back' do
          post :create, { :id => 1 }
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the entry' do
      user = User.create!(:username => "Sussy")
      user2 = User.create!(:username => "Drummy")
      trip = user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      user2.user_trips.create!(:trip_id => trip.id, :trip_role => 'traveler')
      expect do
        delete :destroy, { :id => trip.id, :user_id => user2.id }
      end.to change { UserTrip.count }.by -1
    end
  end
end
