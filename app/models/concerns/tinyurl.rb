class Tinyurl
  include HTTParty
  base_uri 'tinyurl.com'

  def shorten(url)
    self.class.get("/api-create.php?url=#{url}")
  end
end
