json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :dob, :dead
  json.url user_url(user, format: :json)
end
