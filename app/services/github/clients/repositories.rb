# frozen_string_literal: true

module Github
  module Clients
    module Repositories
      def search_repositories_url
        "search/repositories"
      end

      def search_repositories(options = {})
        get search_repositories_url, options
      end
      alias :search_repo :search_repositories
    end
  end
end
