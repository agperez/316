require 'spec_helper'

describe "email_contents/show" do
  before(:each) do
    @email_content = assign(:email_content, stub_model(EmailContent,
      :email => "Email",
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
  end
end
