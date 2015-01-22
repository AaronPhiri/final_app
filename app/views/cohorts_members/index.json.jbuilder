json.array!(@cohorts_members) do |cohorts_member|
  json.extract! cohorts_member, :id, :cohort_id, :patient_id
  json.url cohorts_member_url(cohorts_member, format: :json)
end
