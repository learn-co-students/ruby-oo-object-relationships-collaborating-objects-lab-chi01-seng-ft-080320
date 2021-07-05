class Song
    
    attr_accessor :name, :artist

    @@all = []

    def initialize (name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name) 
        array = file_name.split(" - ")
        song = array[1]
        artist = array[0]
        song = Song.new(song)
        song.artist_name = artist 
        song  
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end