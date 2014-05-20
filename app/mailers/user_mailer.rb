class UserMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "WELCOME")
  end
end
