json.extract! user, :id, :username, :user_location, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt