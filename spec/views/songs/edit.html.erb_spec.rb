require 'spec_helper'

describe "songs/edit" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :name => "MyString",
      :key => "MyString",
      :chart => "MyText"
    ))
  end

  it "renders the edit song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", song_path(@song), "post" do
      assert_select "input#song_name[name=?]", "song[name]"
      assert_select "input#song_key[name=?]", "song[key]"
      assert_select "textarea#song_chart[name=?]", "song[chart]"
    end
  end
end
