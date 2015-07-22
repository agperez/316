class AllMailer < ActionMailer::Base
  default from: "Zacharyadams@mac.com"

  def all_email(user)
    @email_content = EmailContent.last

    mail(to: user.email, subject: "Important C316 Volunteer Information") # no :body
    headers['X-MC-Template'] = "allmail"
    headers['X-MC-MergeVars'] = { "text" => @email_content.text,
                                  "name" => user.first_name
                                }.to_json
  end
end
