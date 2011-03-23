class User < ActiveRecord::Base
  versioned :class_name => "UserVersion"
  
  def has_history?
    !self.versions.blank?
  end
end