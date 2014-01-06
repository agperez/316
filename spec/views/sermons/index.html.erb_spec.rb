require 'spec_helper'

describe "sermons/index" do
  before(:each) do
    assign(:sermons, [
      stub_model(Sermon,
        :book => "Book",
        :chapter => "",
        :verse_last => 1,
        :video => "Video",
        :audio => "Audio",
        :speaker => "Speaker"
      ),
      stub_model(Sermon,
        :book => "Book",
        :chapter => "",
        :verse_last => 1,
        :video => "Video",
        :audio => "Audio",
        :speaker => "Speaker"
      )
    ])
  end

  it "renders a list of sermons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Book".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
    assert_select "tr>td", :text => "Audio".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker".to_s, :count => 2
  end
end
