require 'spec_helper'

describe Trip do
  before do
    user = User.create(username: 'phil')
    @trip = Trip.new(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.owner = user
    @trip.save
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
end
