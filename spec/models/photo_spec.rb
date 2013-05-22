require 'spec_helper'

describe Photo do
  subject do
    user = User.create!(username: 'Gumby')
    Photo.new( :event_created_at => DateTime.parse('Wed Aug 29 17:12:58 +0000 2012'),
               :photo_id => '1',
               :url      => 'http://www.fakeimage.com/lolz.gif',
               :caption  => 'I did it for the lulz.',
               :user_id  => user.id )
  end

  it 'requires a taken at' do
    expect { subject.event_created_at = nil }.to change { subject.valid? }.to false
  end

  it 'requires a photo id' do
    expect { subject.photo_id = nil }.to change { subject.valid? }.to false
  end

  it 'requires a url' do
    expect { subject.url = nil }.to change { subject.valid? }.to false
  end

  it 'requires a user id' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end

  it 'does not require a caption' do
    subject.caption = nil
    expect(subject).to be_valid
  end
end
