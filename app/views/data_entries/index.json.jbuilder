json.array!(@data_entries) do |data_entry|
  json.extract! data_entry, :id, :time, :number
  json.url data_entry_url(data_entry, format: :json)
end
