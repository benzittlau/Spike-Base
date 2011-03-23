module VestalVersions
  class Version
    def reverted?
      self.reverted_from != nil
    end
  end
  
  def live?
    self.version == last_version
  end

  def has_history?
    !self.versions.blank?
  end
  
  module ClassMethods
    def individually_versioned(options = {}, &block)
      #dynamically create the class for the models versions
      version_class_name = "#{self.name}Version"
      #this block creates the class and sets it's table name
      version_class = Class.new(VestalVersions::Version) do
        set_table_name version_class_name.pluralize.underscore
      end
      #this gives the class a name
      Object.const_set(version_class_name, version_class)
      
      individual_options = {:class_name => version_class_name}
      versioned individual_options.merge(options), &block
    end
  end
end