require 'spec_helper'

describe "songs/new" do
  before(:each) do
    assign(:song, stub_model(Song,
      :name => "MyString",
      :key => "MyString",
      :chart => "MyText"
    ).as_new_record)
  end

  it "renders new song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", songs_path, "post" do
      assert_select "input#song_name[name=?]", "song[name]"
      assert_select "input#song_key[name=?]", "song[key]"
      assert_select "textarea#song_chart[name=?]", "song[chart]"
    end
  end
end
