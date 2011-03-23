require 'spec_helper'

describe "widgets/edit.html.haml" do
  before(:each) do
    @widget = assign(:widget, stub_model(Widget,
      :colour => "MyString",
      :shape => "MyString",
      :size => "MyString"
    ))
  end

  it "renders the edit widget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => widgets_path(@widget), :method => "post" do
      assert_select "input#widget_colour", :name => "widget[colour]"
      assert_select "input#widget_shape", :name => "widget[shape]"
      assert_select "input#widget_size", :name => "widget[size]"
    end
  end
end
