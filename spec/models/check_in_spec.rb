require 'spec_helper'

describe CheckIn do
  subject do
    CheckIn.new(:event_created_at => Time.now,
                :check_in_id => '123145',
                :text => 'some text',
                :venue => {:a => 'thing'},
                :user_id => 1)
  end

  it 'requires a checked in at time' do
    expect { subject.event_created_at = nil }.to change { subject.valid? }.to false
  end

  it 'requires a check in id' do
    expect { subject.check_in_id = nil }.to change { subject.valid? }.to false
  end

  it 'requires a unique check in id' do
    expect do
      CheckIn.create(:event_created_at => Time.now,
        :check_in_id => '123145',
        :text => 'some text',
        :venue => {:a => 'thing'},
        :user_id => 1)
    end.to change { subject.valid? }.to false
  end

  it 'requires a user_id' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end
end
