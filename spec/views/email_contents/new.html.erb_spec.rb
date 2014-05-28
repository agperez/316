require 'spec_helper'

describe "email_contents/new" do
  before(:each) do
    assign(:email_content, stub_model(EmailContent,
      :email => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new email_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_contents_path, "post" do
      assert_select "input#email_content_email[name=?]", "email_content[email]"
      assert_select "textarea#email_content_text[name=?]", "email_content[text]"
    end
  end
end
