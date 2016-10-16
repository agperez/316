class UserMailer < ActionMailer::Base
  default from: "zachgadams@gmail.com"
  def reminder_email(user, event)
  	@user = user
  	@event = event
  	mail(to: @user.email, subject: "Reminder: You're serving this Sunday at church!")
  end
end
