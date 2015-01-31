require 'capybara/rails'

RSpec.configure do |c|
  helpers = Module.new do
    def signin user
      visit new_session_path
      within 'form' do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
    end
  end

  c.include helpers
end
