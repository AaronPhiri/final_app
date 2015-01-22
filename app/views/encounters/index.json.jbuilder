json.array!(@encounters) do |encounter|
  json.extract! encounter, :id, :encounter_type, :patient_id, :provider_id, :location_id, :form_id, :encounter_datetime, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :changed_by, :date_changed
  json.url encounter_url(encounter, format: :json)
end
