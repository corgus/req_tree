json.array!(@github_issues) do |github_issue|
  json.extract! github_issue, :id, :github_id, :path
  json.url github_issue_url(github_issue, format: :json)
end
