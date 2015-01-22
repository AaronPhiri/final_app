json.array!(@people) do |person|
  json.extract! person, :id, :gender, :birthdate, :birthdate_estimated, :dead, :death_date, :cause_of_death, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid
  json.url person_url(person, format: :json)
end
