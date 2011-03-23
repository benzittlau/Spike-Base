require 'spec_helper'

describe "widgets/new.html.haml" do
  before(:each) do
    assign(:widget, stub_model(Widget,
      :colour => "MyString",
      :shape => "MyString",
      :size => "MyString"
    ).as_new_record)
  end

  it "renders new widget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => widgets_path, :method => "post" do
      assert_select "input#widget_colour", :name => "widget[colour]"
      assert_select "input#widget_shape", :name => "widget[shape]"
      assert_select "input#widget_size", :name => "widget[size]"
    end
  end
end
