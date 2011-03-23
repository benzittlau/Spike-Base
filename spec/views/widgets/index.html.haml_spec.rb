require 'spec_helper'

describe "widgets/index.html.haml" do
  before(:each) do
    assign(:widgets, [
      stub_model(Widget,
        :colour => "Colour",
        :shape => "Shape",
        :size => "Size"
      ),
      stub_model(Widget,
        :colour => "Colour",
        :shape => "Shape",
        :size => "Size"
      )
    ])
  end

  it "renders a list of widgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Colour".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shape".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Size".to_s, :count => 2
  end
end
