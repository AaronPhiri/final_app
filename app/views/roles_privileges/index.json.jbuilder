json.array!(@roles_privileges) do |roles_privilege|
  json.extract! roles_privilege, :id, :role, :privilege
  json.url roles_privilege_url(roles_privilege, format: :json)
end
