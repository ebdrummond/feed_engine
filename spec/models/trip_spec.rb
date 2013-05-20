require 'spec_helper'

describe Trip do
  before do
    @owner = User.create!(username: 'phil')
    @trip = @owner.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))

    @user = User.create!(username: 'raph')
    @user.user_trips.create!(:trip_id => @trip.id, :trip_role => "kreepr")
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
    xit 'includes all travelers' do
      expect(@trip.travelers).to include @user
    end

    xit 'includes owner' do
      expect(@trip.travelers).to include @owner
    end
  end

  xit 'lists its kreeprs' do
    expect(@trip.kreeprs).to eq([@user2])
  end

  xit 'lists its travelers' do
    expect(@trip.travelers).to eq([@user])
  end

  xit 'lists its visibility setting as public' do
    expect(@trip.visibility_setting).to eq("public")
  end

  xit 'lists its visibility setting as private' do
    @trip.visible = true
    @trip.save
    expect(@trip.visibility_setting).to eq("private")
  end

  xit 'has tweets for trip users' do
    Tweet.create(:tweeted_at => Time.now,
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.trip_user_tweets.count).to eq(1)
  end

  xit 'does not return trip tweets that werent tweeted during trip' do
    Tweet.create(:tweeted_at => Time.now,
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.tweets.count).to eq(0)
  end

  xit 'returns trip tweets that weren tweeted during trip' do
    Tweet.create(:tweeted_at => Date.parse('2013-02-20'),
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.tweets.count).to eq(1)
  end
end
