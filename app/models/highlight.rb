class Highlight < ActiveRecord::Base
  validates_presence_of :title, :created_at, :video, :audio, :sermon_link

  self.per_page = 5

  def self.ordered(params)
    order("created_at DESC").paginate(page: params[:page])
  end


end
