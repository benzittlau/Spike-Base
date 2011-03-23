require "spec_helper"

describe WidgetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/widgets" }.should route_to(:controller => "widgets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/widgets/new" }.should route_to(:controller => "widgets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/widgets/1" }.should route_to(:controller => "widgets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/widgets/1/edit" }.should route_to(:controller => "widgets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/widgets" }.should route_to(:controller => "widgets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/widgets/1" }.should route_to(:controller => "widgets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/widgets/1" }.should route_to(:controller => "widgets", :action => "destroy", :id => "1")
    end

  end
end
