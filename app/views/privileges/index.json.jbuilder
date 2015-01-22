json.array!(@privileges) do |privilege|
  json.extract! privilege, :id, :privilege, :description, :uuid
  json.url privilege_url(privilege, format: :json)
end
