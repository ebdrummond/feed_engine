require 'spec_helper'

describe UsersDatesSearchable do
  describe '.for_users' do
    xit 'makes one database lookup' do
      user = double('I am a user!')
      UsersDatesSearchable.should_receive(:where).with('user_id IN (?)', [user])

      UsersDatesSearchable.for_users([user])
    end
  end
end
