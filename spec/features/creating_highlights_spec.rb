require 'rails_helper'

feature "Highlights" do
  context "Signed in as Admin" do
    before :each do
      user = create :user, :admin
      signin(user)
      visit highlights_path
    end

    it "Should see create highlight" do
      expect( page ).to have_content("Create Highlight")
    end
  end

  context "signed in a a regular user" do
    before :each do
      user = create :user
      signin(user)
      visit highlights_path
    end

    it "should display a list of highlight objects" do
      visit highlights_path
      expect( page ).to have_css(".highlight", count: 2)
    end

    it "Should not let you see create highlight" do
      visit highlights_path
      expect( page ).not_to have_content("Create Highlight")
    end
  end
end
