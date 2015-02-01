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

    it "Allows admins to create highlights" do
      click_link "Create Highlight"
      highlight = build :highlight

      fill_in("highlight[title]", with: highlight.title )
      fill_in("highlight[video]", with: highlight.video )
      fill_in("highlight[audio]", with: highlight.audio )
      fill_in("highlight[sermon_link]", with: highlight.sermon_link )
      fill_in("highlight[created_at]", with: highlight.created_at )

      click_button "Create Highlight"
      expect( page ).to have_content(highlight.title)
    end

    it "Allows admins to see edit button for highlights" do
      highlight = create :highlight
      visit highlight_path(highlight)
      expect( page ).to have_content("Edit")
    end

    it "Allows for admins to edit a highlight" do
      old_highlight = create :highlight
      new_highlight = build :highlight
      visit edit_highlight_path(old_highlight)

      fill_in("highlight[title]", with: new_highlight.title )
      fill_in("highlight[video]", with: new_highlight.video )
      fill_in("highlight[audio]", with: new_highlight.audio )
      fill_in("highlight[sermon_link]", with: new_highlight.sermon_link )
      fill_in("highlight[created_at]", with: new_highlight.created_at )

      click_button "Update Highlight"
      expect( page ).to have_content(new_highlight.title)
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
