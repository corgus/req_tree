json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :summary, :acceptance_criteria, :status
  json.url requirement_url(requirement, format: :json)
end
