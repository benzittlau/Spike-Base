require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    User.new.should be_valid
  end
  
  describe "should have the right attributes" do
    before(:each) do
      @user = User.new
    end
  
    it "should response to name" do
      @user.should respond_to(:name)
    end
  
    it "should respond to email" do
      @user.should respond_to(:email)
    end
  
    it "should respond to phone_number" do
      @user.should respond_to(:phone_number)
    end
  end
end
