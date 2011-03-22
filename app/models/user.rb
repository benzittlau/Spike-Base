class User < ActiveRecord::Base
  has_paper_trail
  
  def has_history?
    self.versions != nil
  end
end