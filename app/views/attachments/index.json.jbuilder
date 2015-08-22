json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :url, :resource_id, :resource_type
  json.url attachment_url(attachment, format: :json)
end
