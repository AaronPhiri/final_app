json.array!(@indicators) do |indicator|
  json.extract! indicator, :id, :user_id, :role
  json.url indicator_url(indicator, format: :json)
end
