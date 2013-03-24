require 'spec_helper'

describe "OmniAuth::Strategies::Xero" do
  subject do
    OmniAuth::Strategies::Xero.new(nil, {})
  end

  context 'client options' do
    it 'has correct site' do
      subject.options.client_options.site.should eq('https://api.xero.com')
    end

    it 'has correct request token path' do
      subject.options.client_options.request_token_path.should eq('/oauth/RequestToken')
    end

    it 'has correct access token path' do
      subject.options.client_options.access_token_path.should eq('/oauth/AccessToken')
    end

    it 'has correct authorize path' do
      subject.options.client_options.authorize_path.should eq('/oauth/Authorize')
    end
  end
end
