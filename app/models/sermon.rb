class Sermon < ActiveRecord::Base
	has_many :notes
	validates :book, :s_date, :chapter, :verse_first, :verse_last, presence: true

	include PgSearch
	pg_search_scope :search, against: [:book, :outline],
		using: {tsearch: {dictionary: "english"}}

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
      search(query)
			#where("to_tsvector('english', book) @@ :q or to_tsvector('english', outline) @@ :q", q: query)
    else
      scoped
    end
	end

end
