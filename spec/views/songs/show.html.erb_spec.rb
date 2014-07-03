require 'spec_helper'

describe "songs/show" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :name => "Name",
      :key => "Key",
      :chart => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Key/)
    rendered.should match(/MyText/)
  end
end
