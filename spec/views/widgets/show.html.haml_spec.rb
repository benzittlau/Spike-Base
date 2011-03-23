require 'spec_helper'

describe "widgets/show.html.haml" do
  before(:each) do
    @widget = assign(:widget, stub_model(Widget,
      :colour => "Colour",
      :shape => "Shape",
      :size => "Size"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Colour/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Shape/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Size/)
  end
end
