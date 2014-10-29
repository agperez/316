require 'spec_helper'

describe "ministries/edit" do
  before(:each) do
    @ministry = assign(:ministry, stub_model(Ministry,
      :name => "MyString"
    ))
  end

  it "renders the edit ministry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ministry_path(@ministry), "post" do
      assert_select "input#ministry_name[name=?]", "ministry[name]"
    end
  end
end
