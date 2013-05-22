require 'spec_helper'

describe CheckIn do
  subject do
    CheckIn.new(:checked_in_at => Time.now,
                :check_in_id => '123145',
                :text => 'some text',
                :venue => 'some venue',
                :location => 'location',
                :short_url => 'url',
                :user_id => 1)
  end

  it 'requires a checked in at time' do
    expect { subject.checked_in_at = nil }.to change { subject.valid? }.to false
  end

  it 'requires a check in id' do
    expect { subject.check_in_id = nil }.to change { subject.valid? }.to false
  end

  it 'requires a unique check in id' do
    expect do
      CheckIn.create(:checked_in_at => Time.now,
        :check_in_id => '123145',
        :text => 'some text',
        :venue => 'some venue',
        :location => 'location',
        :short_url => 'url',
        :user_id => 1)
    end.to change { subject.valid? }.to false
  end

  it 'requires a location' do
    expect { subject.location = nil }.to change { subject.valid? }.to false
  end

  it 'requires a user_id' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end
end
