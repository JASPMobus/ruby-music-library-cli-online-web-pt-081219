class MusicLibraryController
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    
    music_importer = MusicImporter.new(path)
    
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    
    ask = ""
    
    while true do 
      ask = gets
      
      if ask == "exit"
        exit
      end
    end 
  end
  
  def list_songs
    Song.all.each_with_index do |song, index| 
      puts "#{index+1}. #{song.name} - #{song.artist} - #{song.genre}"
    end 
  end
end