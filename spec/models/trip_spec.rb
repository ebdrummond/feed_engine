require 'spec_helper'

describe Trip do
  before do
    @owner = User.create!(username: 'phil')
    @trip = @owner.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.save_with_user_trip

  end

  it 'requires an owner' do
    expect { @trip.owner = nil }.to change { @trip.valid? }.to false
  end

  it 'requires a start date' do
    expect { @trip.start = nil }.to change { @trip.valid? }.to false
  end

  it 'requires an end date' do
    expect { @trip.end = nil }.to change { @trip.valid? }.to false
  end

  it 'requires a destination' do
    expect { @trip.destination = nil }.to change { @trip.valid? }.to false
  end

  it 'requires a name' do
    expect { @trip.name = nil }.to change { @trip.valid? }.to false
  end

  it 'start must come before end' do
    expect { @trip.end = Date.parse('2013-01-01') }.to change { @trip.valid? }.to false
  end

  describe '.save_with_user_trip' do
    let(:trip) { @owner.trips.build(:name => "Something else", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25')) }

    it 'saves the trip' do
      expect { trip.save_with_user_trip }.to change { Trip.count }.by 1
    end

    it 'also creates a user_trip' do
      expect { trip.save_with_user_trip }.to change { UserTrip.count }.by 1
    end
  end

  describe '.travelers' do
    before do
      @user = User.create!(username: 'raph')
      @user.user_trips.create!(:trip_id => @trip.id, :trip_role => "traveler")
    end

    it 'includes all travelers' do
      expect(@trip.travelers).to include @user
    end

    it 'includes owner' do
      expect(@trip.travelers).to include @owner
    end
  end

  describe '.kreepers' do
    before do
      @user = User.create!(username: 'raph')
      @user.user_trips.create!(:trip_id => @trip.id, :trip_role => "kreepr")
    end

    it 'includes all kreeprs' do
      expect(@trip.kreeprs).to eq [@user]
    end
  end
end
