json.array!(@drugs) do |drug|
  json.extract! drug, :id, :drug_id, :concept_id, :name, :combination, :dosage_form, :dosage_strength, :maximum_daily_dose, :minimum_daily_dose, :route, :units, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid
  json.url drug_url(drug, format: :json)
end
