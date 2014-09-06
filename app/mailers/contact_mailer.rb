class ContactMailer < ActionMailer::Base
  default from: "creightonvaughn@gmail.com"
  def contact_email(user)
    @email_content = EmailContent.last
    @user = user
    mail(to: @email_content.recipient, subject: user.first_name+' '+user.last_name + " has sent you a message")
  end
end
