require 'spec_helper'

describe UserTrip do
  before do
    @owner = User.create!(username: 'phil')
    @trip = @owner.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.save

    @user = User.create!(username: 'erin')
    @user_trip = @user.user_trips.build(trip_id: @trip.id, trip_role: "traveler")
  end

  it "requires a user" do
    expect { @user_trip.user = nil }.to change { @user_trip.valid? }.to false
  end

  it "requires a trip" do
    expect { @user_trip.trip = nil }.to change { @user_trip.valid? }.to false
  end

  it "requires a trip_role" do
    expect { @user_trip.trip_role = nil }.to change { @user_trip.valid? }.to false
  end

  it "requires a trip_role that is either 'traveler' or 'kreepr'" do
    expect { @user_trip.trip_role = 'planner' }.to change { @user_trip.valid? }.to false
  end
end
