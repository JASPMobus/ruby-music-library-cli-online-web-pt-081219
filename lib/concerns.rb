module Concerns
  module Findable
    def find_by_name(name)
      @@all.find { |instance| instance.name == name } 
    end
    
    def find_or_create_by_name(name)
      instance = ind_by_name(name)
      
      if !instance
        self.create(name)
      else
        instance
      end
    end
  end
end