class User < ActiveRecord::Base
  versioned :class_name => "#{self.name}Version"
  
  def has_history?
    !self.versions.blank?
  end
end