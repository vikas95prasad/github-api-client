# frozen_string_literal: true

module Github
  # Network layer for API clients.
  module Connection
    CONVENIENCE_HEADERS = Set.new([:accept, :content_type])

    def get(url, options = {})
      request :get, url, parse_query_and_convenience_headers(options)
    end

    def head(url, options = {})
      request :head, url, parse_query_and_convenience_headers(options)
    end

    def agent
      @agent ||= Sawyer::Agent.new(endpoint, sawyer_options) do |http|
        http.headers[:accept] = default_media_type
        http.headers[:content_type] = "application/json"
        http.headers[:user_agent] = user_agent
      end
    end

    protected

      def endpoint
        api_endpoint
      end

    private

      def request(method, path, data, options = {})
        if data.is_a?(Hash)
          options[:query] = data.delete(:query) || {}
          options[:headers] = data.delete(:headers) || {}
          if accept = data.delete(:accept)
            options[:headers][:accept] = accept
          end
        end

        response = agent.call(method, Addressable::URI.parse(path.to_s).normalize.to_s, data, options)
        response.data
      rescue Exception => e
        # To Do
      end

      def sawyer_options
        opts = {
          links_parser: Sawyer::LinkParsers::Simple.new
        }
        conn_opts = @connection_options
        opts[:faraday] = Faraday.new(conn_opts)

        opts
      end

      def parse_query_and_convenience_headers(options)
        options = options.dup
        headers = options.delete(:headers) { Hash.new }
        CONVENIENCE_HEADERS.each do |h|
          if header = options.delete(h)
            headers[h] = header
          end
        end
        query = options.delete(:query)
        opts = { query: options }
        opts[:query].merge!(query) if query && query.is_a?(Hash)
        opts[:headers] = headers unless headers.empty?

        opts
      end
  end
end