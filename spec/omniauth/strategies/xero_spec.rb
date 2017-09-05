require 'spec_helper'

describe "OmniAuth::Strategies::Xero" do
  subject do
    OmniAuth::Strategies::Xero.new(nil, {})
  end

  context 'client options' do
    it 'has correct site' do
      expect(subject.options.client_options.site).to eq('https://api.xero.com')
    end

    it 'has correct request token path' do
      expect(subject.options.client_options.request_token_path).to eq('/oauth/RequestToken')
    end

    it 'has correct access token path' do
      expect(subject.options.client_options.access_token_path).to eq('/oauth/AccessToken')
    end

    it 'has correct authorize path' do
      expect(subject.options.client_options.authorize_path).to eq('/oauth/Authorize')
    end
  end

  context 'organization with no subscriber' do
    it 'gets authorized' do
      expect(subject.raw_info).to_not be_nil
    end
  end
end
