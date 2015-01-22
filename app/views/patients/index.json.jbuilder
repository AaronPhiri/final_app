json.array!(@patients) do |patient|
  json.extract! patient, :id, :tribe, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason
  json.url patient_url(patient, format: :json)
end
