json.array!(@teams) do |team|
  json.extract! team, :name, :color
  json.url team_url(team, format: :json)
end