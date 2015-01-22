json.array!(@users) do |user|
  json.extract! user, :id, :system_id, :username, :password_digest, :secret_question, :secret_answer, :creator, :date_created, :changed_by, :date_changed, :person_id, :retired, :retired_by, :date_retired, :retire_reason, :uuid
  json.url user_url(user, format: :json)
end
