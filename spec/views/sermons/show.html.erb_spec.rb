require 'spec_helper'

describe "sermons/show" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :book => "Book",
      :chapter => "",
      :verse_last => 1,
      :video => "Video",
      :audio => "Audio",
      :speaker => "Speaker"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Book/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/Video/)
    rendered.should match(/Audio/)
    rendered.should match(/Speaker/)
  end
end
