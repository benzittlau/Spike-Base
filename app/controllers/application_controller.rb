class ApplicationController < ActionController::Base
  protect_from_forgery
  #over-riding the default paper_trail functionality that would call
  #current_user
  def user_for_paper_trail
    "Bob Smith"
  end
  
end
