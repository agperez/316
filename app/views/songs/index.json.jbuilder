json.array!(@songs) do |song|
  json.extract! song, :name, :key, :chart
  json.url song_url(song, format: :json)
end