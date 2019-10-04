require("concerns")

class Song
  attr_accessor :name, :artist, :genre
  
  extend Concerns::Findable
  
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
  
  def set_genre(genre)
    @genre = genre
  end
  
  def genre=(genre)
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    # artist - name - genre.mp3
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song = Song.find_or_create_by_name(filename.split(" - ")[1])
    
    artist.add_song(song)
    
    song
  end
end