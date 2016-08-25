class ReturnMailer < ActionMailer::Base
  default from: "zachgadams@gmail.com"
  def return_email(user)
  	@email_content = EmailContent.last
  	mail(to: "zachgadams@gmail.com", subject: "Schedule Change for "+user.first_name+' '+user.last_name)
  end
end
