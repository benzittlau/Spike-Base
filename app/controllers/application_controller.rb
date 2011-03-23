class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    "Sagitarius Sam"
  end
end
