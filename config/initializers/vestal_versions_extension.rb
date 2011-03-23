module VestalVersions
  class Version
    def reverted?
      self.reverted_from != nil
    end
  end
  
  def has_history?
    !self.versions.blank?
  end
  
  module ClassMethods
    def individually_versioned(options = {}, &block)
      individual_options = {:class_name => "#{self.name}Version"}
      versioned individual_options.merge(options), &block
    end
  end
end