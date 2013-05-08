require 'spec_helper'

describe CreateUser do
  let(:auth_hash) do
    {:provider => 'twitter',
     :credentials => { :token => '123', :secret => 'abc' },
     :info => { :nickname => 'nick' },
     :uid => 'abc123'
    }
  end

  let(:normalized_hash) do
    {:provider => 'twitter',
    :token => '123',
    :secret => 'abc',
    :nickname => 'nick',
    :uid => 'abc123'
    }
  end

  it 'normalizes the auth_hash' do
    expect(CreateUser.parse_hash(auth_hash)).to eq normalized_hash
  end

  it '.create_with_provider_transaction creates a user' do
    expect{ CreateUser.create_with_provider_transaction(normalized_hash) }.to change { User.count }.by 1
    expect{ CreateUser.create_with_provider_transaction(normalized_hash) }.to change { AuthSource.count }.by 1
  end

  context '.from_unknown_auth_source with a known user' do
    before do
      @user = CreateUser.create_with_provider_transaction(normalized_hash)
    end

    it 'returns the user' do
      expect(CreateUser.from_unknown_auth_source(auth_hash)).to eq @user
    end
  end

  context '.from_unknown_auth_source with a new user' do
    it 'creates a new user' do
      expect{ CreateUser.from_unknown_auth_source(auth_hash) }.to change { User.count }.by 1
    end

    it 'creates and associates a new service object with that user' do
      expect{ CreateUser.from_unknown_auth_source(auth_hash) }.to change { AuthSource.count }.by 1
    end
  end
end
