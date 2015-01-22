json.array!(@cohorts) do |cohort|
  json.extract! cohort, :id, :name, :description, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :changed_by, :date_changed, :uuid
  json.url cohort_url(cohort, format: :json)
end
