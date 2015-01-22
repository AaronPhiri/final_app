json.array!(@tribes) do |tribe|
  json.extract! tribe, :id, :retired, :name
  json.url tribe_url(tribe, format: :json)
end
