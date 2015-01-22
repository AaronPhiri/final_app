json.array!(@roles_users) do |roles_user|
  json.extract! roles_user, :id, :user_id, :role
  json.url roles_user_url(roles_user, format: :json)
end
