require 'spec_helper'

describe AuthParams do
  subject do
    AuthParams.new({'provider' => 'twitter',
                    'credentials' => {'token' => '1234',
                                      'secret' => '1234'},
                    'uid' => 'abc123' })
  end

  describe '.auth_source_params' do
    it 'parses the provider' do
      auth_source_params = subject.auth_source_params
      expect(auth_source_params['provider']).to eq 'twitter'
    end

    it 'parses the token' do
      auth_source_params = subject.auth_source_params
      expect(auth_source_params['token']).to eq '1234'
    end

    it 'parses the uid' do
      auth_source_params = subject.auth_source_params
      expect(auth_source_params['uid']).to eq 'abc123'
    end

    it 'parses the secret for twitter' do
      auth_source_params = subject.auth_source_params
      expect(auth_source_params['secret']).to eq '1234'
    end
  end

  describe '.user_params' do
    let(:params) { {'info' => {'image' => 'www.hehe.com',
                               'nickname' => 'jorge'} } }

    it 'parses image href' do
      user_params = AuthParams.new(params).user_params
      expect(user_params['image_href']).to eq 'www.hehe.com'
    end

    it 'parses nickname' do
      user_params = AuthParams.new(params).user_params
      expect(user_params['nickname']).to eq 'jorge'
    end
  end
end
