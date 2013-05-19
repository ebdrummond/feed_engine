require 'spec_helper'

describe Note do
  subject do
    user = User.create!(username: 'someone')
    trip = user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    user.notes.build(:text => 'Loving this trip', :trip_id => trip.id)
  end

  it 'requires text' do
    expect { subject.text = nil }.to change { subject.valid? }.to false
  end

  it 'requires a user' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end

  it 'requires a trip' do
    expect { subject.trip_id = nil }.to change { subject.valid? }.to false
  end
end
