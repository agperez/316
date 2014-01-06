require 'spec_helper'

describe "sermons/new" do
  before(:each) do
    assign(:sermon, stub_model(Sermon,
      :book => "MyString",
      :chapter => "",
      :verse_last => 1,
      :video => "MyString",
      :audio => "MyString",
      :speaker => "MyString"
    ).as_new_record)
  end

  it "renders new sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sermons_path, "post" do
      assert_select "input#sermon_book[name=?]", "sermon[book]"
      assert_select "input#sermon_chapter[name=?]", "sermon[chapter]"
      assert_select "input#sermon_verse_last[name=?]", "sermon[verse_last]"
      assert_select "input#sermon_video[name=?]", "sermon[video]"
      assert_select "input#sermon_audio[name=?]", "sermon[audio]"
      assert_select "input#sermon_speaker[name=?]", "sermon[speaker]"
    end
  end
end
