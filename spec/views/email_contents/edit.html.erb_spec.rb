require 'spec_helper'

describe "email_contents/edit" do
  before(:each) do
    @email_content = assign(:email_content, stub_model(EmailContent,
      :email => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit email_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_content_path(@email_content), "post" do
      assert_select "input#email_content_email[name=?]", "email_content[email]"
      assert_select "textarea#email_content_text[name=?]", "email_content[text]"
    end
  end
end
