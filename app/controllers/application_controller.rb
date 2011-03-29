class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
    def current_user
      "Sagitarius Sam"
    end
end