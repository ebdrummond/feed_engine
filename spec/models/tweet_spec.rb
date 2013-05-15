require 'spec_helper'

describe Tweet do
  subject do
    user = User.create!(username: 'Erin')
    Tweet.new(:tweeted_at => DateTime.parse('Wed Aug 29 17:12:58 +0000 2012'),
              :tweet_id => '12345',
              :text => 'omg tweeting for teh win',
              :user_id => user.id)
  end

  it 'requires a tweeted_at' do
    expect { subject.tweeted_at = nil }.to change { subject.valid? }.to false
  end

  it 'requires a tweet_id' do
    expect { subject.tweet_id = nil }.to change { subject.valid? }.to false
  end

  it 'requires a unique tweet_id' do
    expect {
      Tweet.create!(:tweeted_at => DateTime.parse('Wed Aug 29 17:12:58 +0000 2012'),
                    :tweet_id => '12345',
                    :text => 'omg tweeting for teh win',
                    :user_id => 1)
      }.to change { subject.valid? }.to false
  end

  it 'requires a user_id' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end
end
