json.array!(@encounters_types) do |encounters_type|
  json.extract! encounters_type, :id, :name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid
  json.url encounters_type_url(encounters_type, format: :json)
end
