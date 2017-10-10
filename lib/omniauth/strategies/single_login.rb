require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SingleLogin < OmniAuth::Strategies::OAuth2
      option :name, :single_login

      option :client_options, { :site => 'http://localhost:3000' }

      uid{ raw_info['id'] }

      info do
        {
            :name => raw_info['name'],
            :email => raw_info['email']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end