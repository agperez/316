require 'rails_helper'

feature "Highlights" do

  before :all do
    user = create :user
  end


  before :each do
    visit highlights_path
  end

  focus "should display a list of highlight objects" do
    Capybara.save_and_open_page
    expect( page ).to have_css(".highlight", count: 2)
  end


end
