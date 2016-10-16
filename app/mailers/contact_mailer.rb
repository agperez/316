class ContactMailer < ActionMailer::Base
  default from: "zachgadams@gmail.com"
  def contact_email(user)
    @email_content = EmailContent.last
    @recipient = User.find_by_email(@email_content.recipient)
    @user = user
    mail(to: @email_content.recipient, subject: user.first_name+' '+user.last_name + " has sent you a message")
  end
end
