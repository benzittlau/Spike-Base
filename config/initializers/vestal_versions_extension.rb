module VestalVersions
  class Version
    def reverted?
      self.reverted_from != nil
    end
  end
end