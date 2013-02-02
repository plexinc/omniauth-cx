require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class CX < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.cx.com/1',
        :authorize_url => 'https://www.cx.com/mycx/oauth/authorize',
        :token_method => :post,
        :token_url => 'https://api.cx.com/1/oauth/token',
        :param_name => 'access_token'
      }

      def callback_url
        super.sub('http:', 'https:')
      end

      def build_access_token
        verifier = request.params['auth_code']
        client.auth_code.get_token(verifier, {:redirect_uri => callback_url}.merge(options.token_params.to_hash(:symbolize_keys => true)))
      end

      def request_phase
        super
      end

      uid { raw_info['profile']['id'].to_s }

      info do
        {
          'username' => raw_info['profile']['username'],
          'email' => raw_info['profile']['contact']['email'],
          'image' => raw_info['profile']['avatar']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('users/self').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'cx', 'CX'
