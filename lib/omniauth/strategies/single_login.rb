require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SingleLogin < OmniAuth::Strategies::OAuth2
      option :name, :single_login

      option :client_options, {
          site: 'http://localhost:3000',
          token_url: '/api/v1/authorizations/request_token',
          authorize_url: 'http://localhost:3000/api/v1/authorizations/authorize'
      }

      uid{ raw_info['id'] }

      info do
        {
            name: raw_info['name'],
            email: raw_info['email'],
            avatar_url: raw_info['avatar_url']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/users/me?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end