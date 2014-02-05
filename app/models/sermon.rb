class Sermon < ActiveRecord::Base
	validates :book, :s_date, :chapter, :verse_first, :verse_last, presence: true
end
