module Concerns
  module Findable
    def self.find_by_name(name)
      @@all.find { |instance| instance.name == name } 
    end
    
    def self.find_or_create_by_name(name)
      instance = self.find_by_name(name)
      
      if !instance
        self.create(name)
      else
        song 
      end
    end
  end
end