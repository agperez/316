class ScheduleMailer < ActionMailer::Base
  default from: "zachgadams@gmail.com"
  def schedule_email(user, events)
  	@user = user
  	@events = events
  	mail(to: @user.email, subject: "Up coming service dates")
  end
end
