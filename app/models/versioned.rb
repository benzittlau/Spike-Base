class Versioned < ActiveRecord::Base
  private
    def self.create_version_class
      "#{self.name}Version"
    end
end