class Sermon < ActiveRecord::Base
	has_many :notes
	validates :book, :s_date, :chapter, :verse_first, :verse_last, presence: true

	def self.recent
		where(published: [true, nil]).order("s_date DESC").limit(5)
	end

	def self.ordered(params)
		where(published: [true, nil]).order("s_date DESC").paginate(page: params[:page])
	end

	def self.all_sermons
		all.order("s_date DESC")
	end

	def self.text_search(query)
    if query.present?
      where("book @@ :q or outline @@ :q", q: query)
    else
      scoped
    end
  end

end
