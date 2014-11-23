ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "localhost:3000",
  :user_name            => "creightonvaughn@gmail.com",
  :password             => "",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
