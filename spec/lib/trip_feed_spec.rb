require 'spec_helper'

describe TripFeed do

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
