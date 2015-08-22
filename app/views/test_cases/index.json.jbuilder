json.array!(@test_cases) do |test_case|
  json.extract! test_case, :id, :title, :summary, :manual_process, :automated_test_path
  json.url test_case_url(test_case, format: :json)
end
