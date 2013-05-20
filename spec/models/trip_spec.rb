require 'spec_helper'

describe Trip do
  before do
    @user = User.create(username: 'phil')
    @user2 = User.create(username: 'raph')
    @trip = Trip.new(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    @trip.owner = @user
    @trip.save
    UserTrip.create(:user_id => @user.id, :trip_id => @trip.id, :trip_role => "traveler")
    UserTrip.create(:user_id => @user2.id, :trip_id => @trip.id, :trip_role => "kreepr")
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

  it 'lists its kreeprs' do
    expect(@trip.kreeprs).to eq([@user2])
  end

  it 'lists its travelers' do
    expect(@trip.travelers).to eq([@user])
  end

  it 'lists its visibility setting as public' do
    expect(@trip.visibility_setting).to eq("public")
  end

  it 'lists its visibility setting as private' do
    @trip.visible = true
    @trip.save
    expect(@trip.visibility_setting).to eq("private")
  end

  it 'has tweets for trip users' do
    Tweet.create(:tweeted_at => Time.now,
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.trip_user_tweets.count).to eq(1)
  end

  it 'does not return trip tweets that werent tweeted during trip' do
    Tweet.create(:tweeted_at => Time.now,
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.tweets.count).to eq(0)
  end

  it 'returns trip tweets that weren tweeted during trip' do
    Tweet.create(:tweeted_at => Date.parse('2013-02-20'),
                 :tweet_id => '12345',
                 :text => 'omg tweeting for teh win',
                 :user_id => @user.id)
    expect(@trip.tweets.count).to eq(1)
  end
end
