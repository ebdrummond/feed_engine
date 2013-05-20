require 'spec_helper'

describe UserTrip do
  before do
    @user = User.create(username: 'phil')
    @trip = Trip.new(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.owner = @user
    @trip.save
    @user_trip = UserTrip.create(user_id: @user.id, trip_id: @trip.id, trip_role: "traveler")
  end

  it "references its user" do
    expect(@user_trip.user).to eq(@user)
  end

  it "references its trip" do
    expect(@user_trip.trip).to eq(@trip)
  end

  it "requires a user id" do
    @user_trip.user_id = nil
    expect(@user_trip.valid?).to be_false
  end

  it "requires a trip id" do
    @user_trip.trip_id = nil
    expect(@user_trip.valid?).to be_false
  end
end
