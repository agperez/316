module SermonsHelper
	def sermon_title(sermon)
		book = sermon.book
		first_chapter = sermon.chapter.to_s
		first_verse = sermon.verse_first.to_s
		last_chapter = sermon.chapter_last
		last_verse = sermon.verse_last.to_s
		if last_chapter.nil?
			book + " " + first_chapter + ":" + first_verse + "-" + last_verse
		else
			book + " " + first_chapter + ":" + first_verse + "-" + last_chapter.to_s + ":" + last_verse
		end
	end
end
