class Sermon < ActiveRecord::Base
	has_many :notes
	validates :book, :s_date, :chapter, :verse_first, :verse_last, presence: true
end
