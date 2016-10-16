class PrayerMailer < ActionMailer::Base
  default from: "zachgadams@gmail.com"
  def prayer_email(user)
    @email_content = EmailContent.last
    @user = user
    mail(to: "zachgadams@gmail.com", subject: user.first_name+' '+user.last_name + " has a prayer request")
  end
end
