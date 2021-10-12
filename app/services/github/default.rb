# frozen_string_literal: true

module Github
  module Default
    API_ENDPOINT = "https://api.github.com"
    USER_AGENT = "Github-API-Client"
    MEDIA_TYPE = "application/vnd.github.v3+json"

    class << self
      def connection_options
        {
          headers: {
            accept: default_media_type,
            user_agent: user_agent
          }
        }
      end

      def default_media_type
        MEDIA_TYPE
      end

      def user_agent
        USER_AGENT
      end

      def api_endpoint
        API_ENDPOINT
      end
    end
  end
end
