require 'spec_helper'

describe User do
  subject do
    User.new(username: 'raphael')
  end

  it 'requires a username' do
    expect{ subject.username = '' }.to change { subject.valid? }.to be_false
  end

  it 'requires a unique username' do
    subject.save
    expect(User.new(username: 'raphael')).to_not be_valid
  end

  it 'determines whether a user is authorized to view a trip' do
    trip = Trip.create(:name => "a", :destination => "a", :start => Date.today, :end => Date.today + 1)
    expect(subject.authorized_to_view(trip)).to be_false
  end

  it 'determines whether a user exists' do
    expect(User.validate_exists(subject)).to be_false
  end
end
