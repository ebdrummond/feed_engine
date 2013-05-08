require 'spec_helper'

describe AuthSource do
  subject do
    AuthSource.new(normalized_hash.merge(:user => User.create(username: 'raphael')))
  end

  let(:normalized_hash) do
    {:provider => 'twitter',
    :token => '123',
    :secret => 'abc',
    :nickname => 'nick',
    :uid => 'abc123'
    }
  end
end
