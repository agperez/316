json.array!(@setlists) do |setlist|
  json.extract! setlist, :date
  json.url setlist_url(setlist, format: :json)
end