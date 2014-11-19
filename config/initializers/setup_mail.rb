ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'creightonvaughn@gmail.com',
  :password             => 'C200204960v',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
