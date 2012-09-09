require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class OauthDemo < OmniAuth::Strategies::OAuth2

      CUSTOM_PROVIDER_URL = ENV["IDENTITY_PROVIDER_URL"]
      # Give your strategy a name.
      option :name, "oauth_demo"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site =>  CUSTOM_PROVIDER_URL,
        :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/oauth_demo/authorize",
        :access_token_url => "#{CUSTOM_PROVIDER_URL}/auth/oauth_demo/access_token"
      }

      uid { raw_info['id'] }

      info do
        {
          :first_name => raw_info["info"]['first_name'],
          :last_name => raw_info["info"]['last_name'],
          :email => raw_info["info"]['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/oauth_demo/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end
