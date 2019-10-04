class Song
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    if artist
      self.artist=(artist)
    else
      @artist = artist
    end
    
    if genre
      self.genre=(genre)
    else
      @genre = genre 
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name, artist = nil)
    song = Song.new(name, artist)
    
    song.save
    
    song
  end
  
  def set_artist(artist)
    @artist = artist
  end
  
  def artist=(artist)
    artist.add_song(self)
  end
end