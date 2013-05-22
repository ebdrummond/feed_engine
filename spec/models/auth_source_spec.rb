require 'spec_helper'

describe AuthSource do
  subject do
    user = User.create(username: 'raphael')
    user.auth_sources.build(normalized_hash)
  end

  let(:normalized_hash) do
    {:provider => 'twitter',
    :token => '123',
    :secret => 'abc',
    :uid => 'abc123'
    }
  end

  it 'requires a provider' do
    expect { subject.provider = nil }.to change { subject.valid? }.to false
  end

  it 'requires a token' do
    expect { subject.token = nil }.to change { subject.valid? }.to false
  end

  it 'requires a uid' do
    expect { subject.uid = nil }.to change { subject.valid? }.to false
  end

  it 'requires a user' do
    expect { subject.user_id = nil }.to change { subject.valid? }.to false
  end

  context 'provider is twitter' do
    it 'requires a secret' do
      expect { subject.secret = nil }.to change { subject.valid? }.to false
    end
  end

  context 'provider is foursquare' do
    it 'does not require a secret' do
      subject.provider = 'foursquare'
      expect { subject.secret = nil }.to_not change { subject.valid? }.to false
    end
  end

  context 'provider is instagram' do
    it 'does not require a secret' do
      subject.provider = 'instagram'
      expect { subject.secret = nil }.to_not change { subject.valid? }.to false
    end
  end

  describe '.grouped_by_provider' do
    it 'returns all auth sources grouped by provider' do
      subject.save

      expect(AuthSource.grouped_by_provider).to eq({'twitter' => [subject] })
    end
  end
end
