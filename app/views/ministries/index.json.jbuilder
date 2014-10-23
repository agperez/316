json.array!(@ministries) do |ministry|
  json.extract! ministry, :name
  json.url ministry_url(ministry, format: :json)
end