require 'spec_helper'

describe TripsHelper do
  describe '.pretty_date_range' do
    context 'within the same year' do
      it 'prettifies dates' do
        user = User.create!(:username => 'rafi')
        trip = user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))

        expect(pretty_date_range(trip)).to eq 'February 20 - February 25, 2013'
      end
    end

    context 'starting and ending in different years' do
      it 'prettifies dates' do
        user = User.create!(:username => 'rafi')
        trip = user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2014-02-25'))

        expect(pretty_date_range(trip)).to eq 'February 20, 2013 - February 25, 2014'
      end
    end
  end
end
