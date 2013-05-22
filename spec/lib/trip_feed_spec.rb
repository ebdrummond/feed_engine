require 'spec_helper'

describe TripFeed do
  before do
    @owner = User.create!(:username => 'Bang it out')
    @trip = @owner.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-10-25'))
    @trip.save_with_user_trip

    @trip_feed = TripFeed.new(:trip => @trip)
  end

  describe '#notes' do
    before do
      @note = @trip.notes.build(text: 'Oh hello, is it me you are looking for?')
      @note.user = @owner
      @note.save
    end

    it 'returns all notes for trip' do
      expect(@trip_feed.notes).to eq [@note]
    end
  end

  describe '#feed' do
    before do
      @note = @trip.notes.build(text: 'Oh hello, is it me you are looking for?')
      @note.user = @owner
      @note.save

      @tweet = Tweet.create!(:event_created_at => Time.now,
                            :tweet_id => '12345',
                            :text => 'omg tweeting for teh win',
                            :user_id => @owner.id)

      @photo = Photo.create!(:event_created_at => Time.now,
                            :photo_id => '12345',
                            :url => 'some photo url',
                            :caption => 'caption eh',
                            :user_id => @owner.id)

      @check_in = CheckIn.create!(:event_created_at => Time.now,
                                 :text => '12345',
                                 :check_in_id => '12345',
                                 :venue => {:a => 'omg tweeting for teh win'},
                                 :user_id => @owner.id)

      @tweet2 = Tweet.create!(:event_created_at => Time.now + 1.year ,
                              :tweet_id => '12346',
                              :text => 'omg tweeting for teh win',
                              :user_id => @owner.id)
    end

    it 'returns sorted notes, tweets, checkins, and photos for trip within date range' do
      expect(@trip_feed.feed).to eq [ @check_in, @photo, @tweet, @note]
    end
  end
end
