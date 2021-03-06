class Sermon < ActiveRecord::Base
	has_many :notes
	validates :book, :s_date, :chapter, :verse_first, :verse_last, presence: true

	include PgSearch
	pg_search_scope :search, against: [:book, :chapter],
		using: {tsearch: {dictionary: "english"}}

	pg_search_scope :search_by_tag, against: :tags,
		using: {tsearch: {dictionary: "english"}}


	def self.recent
		where(published: [true, nil]).order("s_date DESC").limit(5)
	end

	def self.ordered(params)
		where(published: [true, nil]).reorder("s_date DESC").paginate(page: params[:page])
	end

	def self.all_sermons
		all.order("s_date DESC")
	end

	def self.text_search(query)
    if query.present?
      search(query)
    else
      all
    end
	end

end
