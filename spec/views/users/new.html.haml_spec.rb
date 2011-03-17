require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :phone_number => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_address", :name => "user[address]"
      assert_select "input#user_city", :name => "user[city]"
      assert_select "input#user_phone_number", :name => "user[phone_number]"
    end
  end
end
