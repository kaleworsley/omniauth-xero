require "omniauth/strategies/oauth"
require "multi_xml"

module OmniAuth
  module Strategies
    class Xero < OmniAuth::Strategies::OAuth

      args [:consumer_key, :consumer_secret]

      option :client_options, {
        :access_token_path  => "/oauth/AccessToken",
        :authorize_path     => "/oauth/Authorize",
        :request_token_path => "/oauth/RequestToken",
        :site               => "https://api.xero.com",
      }

      info do
        {
          :first_name => raw_info["FirstName"],
          :last_name  => raw_info["LastName"],
        }
      end

      uid { raw_info["UserID"] }

      extra do
        { "raw_info" => raw_info }
      end

      def raw_info
        @raw_info ||= MultiXml.parse(access_token.get("/api.xro/2.0/Users").body)["Response"]["Users"]["User"]
        @raw_info.is_a?(Array) ? @raw_info.first : @raw_info
      end
    end
  end
end
