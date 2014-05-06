json.array!(@roles) do |role|
  json.extract! role, :name, :color
  json.url role_url(role, format: :json)
end