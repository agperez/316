class ReturnMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def rtrnemail(user)
  	@user = user
  	mail(to: "myclawmail@gmail.com", subject: @user.name)
  end
end
