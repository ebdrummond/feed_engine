require 'spec_helper'

describe TravelerTrip do
  before do
    @user = User.create(username: 'phil')
    @trip = Trip.new(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.owner = @user
    @trip.save
    @traveler_trip = TravelerTrip.create(user_id: @user.id, trip_id: @trip.id)
  end

  it "references its user" do
    expect(@traveler_trip.user).to eq(@user)
  end

  it "references its trip" do
    expect(@traveler_trip.trip).to eq(@trip)
  end

  it "requires a user id" do
    @traveler_trip.user_id = nil
    expect(@traveler_trip.valid?).to be_false
  end

  it "requires a trip id" do
    @traveler_trip.trip_id = nil
    expect(@traveler_trip.valid?).to be_false
  end
end
