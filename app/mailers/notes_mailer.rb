class NotesMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def notes_mailer(user)
  	@user = user
  	@note = @user.notes.last
  	@book = @note.sermon.book.to_s + " " + @note.sermon.chapter.to_s + ":" + @note.sermon.verse_first.to_s + "-" + @note.sermon.verse_last.to_s
	mail(to: @user.email, subject: "Your notes from " + @book)
  end
end
