# frozen_string_literal: true

module Github
  module Configurable
    attr_accessor :api_endpoint, :connection_options, :default_media_type, :user_agent, :web_endpoint

    class << self
      def keys
        @keys ||= [
          :api_endpoint,
          :connection_options,
          :default_media_type,
          :user_agent,
        ]
      end
    end
  end
end
