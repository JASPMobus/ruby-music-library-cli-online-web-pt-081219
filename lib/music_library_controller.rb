class MusicLibraryController
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    
    music_importer = MusicImporter.new(path)
    
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    ask = ""
    
    until ask == "exit" do 
      ask = gets
      
      if ask == "exit"
        
      end
    end 
  end
  
  def list_songs
    Song.all.each_with_index do |song, index| 
      puts "#{index+1}. #{song.name} - #{song.artist} - #{song.genre}"
    end 
  end
end