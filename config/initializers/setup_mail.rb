ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "localhost:3000",
  :user_name            => ENV['EMAIL_USER'],
  :password             => ENV['EMAIL_PASSWORD'],
  :authentication       => :login,
  :enable_starttls_auto => true
}
