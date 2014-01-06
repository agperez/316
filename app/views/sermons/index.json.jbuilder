json.array!(@sermons) do |sermon|
  json.extract! sermon, :book, :chapter, :verse_last, :video, :audio, :speaker, :s_date
  json.url sermon_url(sermon, format: :json)
end