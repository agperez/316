require 'spec_helper'

describe "email_contents/index" do
  before(:each) do
    assign(:email_contents, [
      stub_model(EmailContent,
        :email => "Email",
        :text => "MyText"
      ),
      stub_model(EmailContent,
        :email => "Email",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of email_contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
