require 'spec_helper'

describe "ministries/index" do
  before(:each) do
    assign(:ministries, [
      stub_model(Ministry,
        :name => "Name"
      ),
      stub_model(Ministry,
        :name => "Name"
      )
    ])
  end

  it "renders a list of ministries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
