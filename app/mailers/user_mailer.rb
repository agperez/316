class UserMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def welcome_email(user, event)
  	@user = user
  	@event = event
  	mail(to: @user.email, subject: "Reminder: You're serving this Sunday at church!")
  end
end
