class ReturnMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def return_email(email_content)
  	@email_content = EmailContent.last
  	mail(to: "creightonvaughn@gmail.com", subject: @email_content.email)
  end
end
