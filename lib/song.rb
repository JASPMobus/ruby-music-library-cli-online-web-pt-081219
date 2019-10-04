class Song
  attr_accessor :name
  
  @@all 
  
  def initialize(name)
    @name = name
    
    @@all << self
  end
  
  def selfall
    @@all
  end
end