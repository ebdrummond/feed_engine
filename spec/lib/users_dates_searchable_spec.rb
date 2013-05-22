require 'spec_helper'

describe UsersDatesSearchable do
  describe '.for_users' do
    # TODO: Ask Franklin tomorrow
    xit 'makes one database lookup' do
      user = double('I am a user!')
      UsersDatesSearchable.should_receive(:where).with('user_id IN (?)', [user])

      UsersDatesSearchable.for_users([user])
    end
  end

  describe '.in_range' do
    it 'does something'
  end
end
