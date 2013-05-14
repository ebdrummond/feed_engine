require 'spec_helper'

describe Trip do
  subject do
    user = User.create(username: 'phil')
    user.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
  end

  it 'requires an owner' do
    expect { subject.owner = nil }.to change { subject.valid? }.to false
  end

  it 'requires a start date' do
    expect { subject.start = nil }.to change { subject.valid? }.to false
  end

  it 'requires an end date' do
    expect { subject.end = nil }.to change { subject.valid? }.to false
  end

  it 'requires a destination' do
    expect { subject.destination = nil }.to change { subject.valid? }.to false
  end

  it 'requires a name' do
    expect { subject.name = nil }.to change { subject.valid? }.to false
  end

  it 'start must come before end' do
    expect { subject.end = Date.parse('2013-01-01') }.to change { subject.valid? }.to false
  end
end
