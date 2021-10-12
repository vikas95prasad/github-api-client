# frozen_string_literal: true

class Api::V1::SearchController < Api::V1::BaseController
  def index
  end

  def repositories
    q = params[:q]
    @repo_data = Github::Client.new.search_repo({ q: q, sort: "stars", order: "desc", per_page: 10, page: 1 })
  end
end
