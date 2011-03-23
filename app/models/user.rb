class User < ActiveRecord::Base
  versioned
  
  def has_history?
    self.versions != nil
  end
end
