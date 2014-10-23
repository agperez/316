require 'spec_helper'

describe "ministries/new" do
  before(:each) do
    assign(:ministry, stub_model(Ministry,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new ministry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ministries_path, "post" do
      assert_select "input#ministry_name[name=?]", "ministry[name]"
    end
  end
end
