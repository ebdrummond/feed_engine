require 'spec_helper'

describe UsersDatesSearchable do
  subject do
    class TestMixedinSubject
      extend ::UsersDatesSearchable
    end
  end

  describe '.for_users' do
    it 'makes one database lookup with params' do
      subject.should_receive(:where).with('user_id IN (?)', [1, 2])
      subject.for_users([1, 2])
    end
  end

  describe '.in_range' do
    it 'makes one database lookup' do
      subject.stub(:event_created_at).and_return(:created_at)
      subject.should_receive(:where).with(:created_at => 1..2)
      subject.in_range(1,2)
    end
  end

  describe '.event_created_at' do
    it 'raises error when not implemented into host class' do
      expect { subject.event_created_at }.to raise_error NotImplementedError
    end
  end
end
