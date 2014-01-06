require 'spec_helper'

describe "sermons/edit" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :book => "MyString",
      :chapter => "",
      :verse_last => 1,
      :video => "MyString",
      :audio => "MyString",
      :speaker => "MyString"
    ))
  end

  it "renders the edit sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sermon_path(@sermon), "post" do
      assert_select "input#sermon_book[name=?]", "sermon[book]"
      assert_select "input#sermon_chapter[name=?]", "sermon[chapter]"
      assert_select "input#sermon_verse_last[name=?]", "sermon[verse_last]"
      assert_select "input#sermon_video[name=?]", "sermon[video]"
      assert_select "input#sermon_audio[name=?]", "sermon[audio]"
      assert_select "input#sermon_speaker[name=?]", "sermon[speaker]"
    end
  end
end
