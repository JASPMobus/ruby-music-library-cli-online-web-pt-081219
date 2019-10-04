module Concerns
  module Findable
  def self.find_by_name(name)
    @@all.find { |song| song.name == name } 
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    
    if !song 
      Song.create(name)
    else
      song 
    end
  end
    
  end
end