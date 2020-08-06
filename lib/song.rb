


class Song

    attr_accessor :name
    attr_reader :artist

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end


    def artist=(artist)
        @artist = artist
    end 


    def self.all
        @@all
    end 


    def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end 

    
    def self.new_by_filename(filename)
        split_file = filename.split("-")
        song = Song.new(split_file[1].strip)
        song.artist = Artist.find_or_create_by_name(split_file[0].strip)
        song
    end
end
