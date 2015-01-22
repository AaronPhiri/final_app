json.array!(@users_properties) do |users_property|
  json.extract! users_property, :id, :user_id, :property, :property_value
  json.url users_property_url(users_property, format: :json)
end
