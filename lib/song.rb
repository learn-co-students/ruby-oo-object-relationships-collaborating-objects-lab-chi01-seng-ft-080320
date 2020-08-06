
class Song

    attr_accessor :name, :artist
    @@all = []
    #accepts a name for the song and makes it accessible through an attribute accessor
    def initialize(name)
        @name = name 
        @artist = artist 

        Song.all << self 
    end 
    #returns all existing Song instances
    def self.all 
        @@all 
    end

    #creates a new instance of a song from the file that's passed and associates with artist
    def self.new_by_filename(file_name) 
        file_array = file_name.split(" - ")
        song = file_array[1]
        artist = file_array[0]
        new_song = Song.new(song)
        new_song.artist_name = artist 
        new_song  
    end
    #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end #of Song class