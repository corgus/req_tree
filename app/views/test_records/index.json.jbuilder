json.array!(@test_records) do |test_record|
  json.extract! test_record, :id, :status, :timestamp, :server
  json.url test_record_url(test_record, format: :json)
end
