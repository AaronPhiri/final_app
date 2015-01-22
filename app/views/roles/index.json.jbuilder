json.array!(@roles) do |role|
  json.extract! role, :id, :role, :description, :uuid
  json.url role_url(role, format: :json)
end
