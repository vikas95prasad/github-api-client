# frozen_string_literal: true

json.repositories do
  json.array! @repo_data["items"] do |item|
    json.id item.id
    json.name item.name
    json.fullName item.full_name
    json.htmlUrl item.html_url
    json.description item.description
    json.visibility item.visibility
    json.forks_count item.forks_count
    json.createdAt item.created_at
    json.watchers item.watchers
  end
end

json.total_count @repo_data["total_count"] || 0
