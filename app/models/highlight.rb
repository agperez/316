class Highlight < ActiveRecord::Base
  validates_presence_of :title, :created_at, :video, :audio, :sermon_link
  extend FriendlyId
  friendly_id :title, use: :slugged

  self.per_page = 5

  def self.ordered(params)
    order("created_at DESC").paginate(page: params[:page])
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def tinyurl(url)
    t = Tinyurl.new
    t.shorten(url)
  end

end
