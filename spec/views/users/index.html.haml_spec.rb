require 'spec_helper'

describe "users/index.html.haml" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :phone_number => "Phone Number"
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
