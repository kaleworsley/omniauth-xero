require "omniauth/strategies/oauth"

module OmniAuth
  module Strategies
    class Xero < OmniAuth::Strategies::OAuth

      args [:consumer_key, :consumer_secret]

      option :client_options, {
        access_token_path:  "/oauth/AccessToken",
        authorize_path:     "/oauth/Authorize",
        request_token_path: "/oauth/RequestToken",
        site:               "https://api.xero.com",
      }

      credentials do
        {
          token:      access_token.token,
          secret:     access_token.secret,
          expires_at: (Time.now + Integer(access_token.params[:oauth_expires_in])).to_i
        }
      end

      info do
        {
          first_name: raw_info["FirstName"],
          last_name:  raw_info["LastName"],
          email:      raw_info["EmailAddress"]
        }
      end

      uid { raw_info["UserID"] }

      extra do
        { raw_info: raw_info }
      end

      private

      def raw_info
        @raw_info ||= users.find { |user| user["IsSubscriber"] }
      end

      def users
        @users ||= JSON.parse(access_token.get("/api.xro/2.0/Users", {'Accept'=>'application/json'}).body)["Users"]
      end
    end
  end
end
