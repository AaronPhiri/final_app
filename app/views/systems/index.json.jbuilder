json.array!(@systems) do |system|
  json.extract! system, :id, :system_id, :system_name, :description
  json.url system_url(system, format: :json)
end
