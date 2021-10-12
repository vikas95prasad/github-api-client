# frozen_string_literal: true

class Api::V1::SearchController < Api::V1::BaseController
  DEFAULT_PER_PAGE = 10
  DEFAULT_PAGE = 1
  DEFAULT_ORDER = "desc"
  DEFAULT_SORT = "stars"

  def index
  end

  def repositories
    render_required_parameter_missing if search_term.blank?

    @repo_data = github_client.search_repositories(search_options)
  end

  private

    def github_client
      Github::Client.new
    end

    def search_term
      params.require(:q)
    end

    def search_options
      {
        q: search_term,
        sort: DEFAULT_SORT,
        order: DEFAULT_SORT,
        per_page: DEFAULT_PER_PAGE,
        page: DEFAULT_PAGE
      }
    end
end
