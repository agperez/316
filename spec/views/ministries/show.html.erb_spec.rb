require 'spec_helper'

describe "ministries/show" do
  before(:each) do
    @ministry = assign(:ministry, stub_model(Ministry,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
