class Artist

    attr_accessor :name 
    @@all = []
    #initialize with name
    def initialize(name)
        @name = name 

        Artist.all << self 
    end
    #returns all existing Artist instances
    def self.all 
        @@all 
    end
    #lists all songs that belong to this artist
    def songs 
        Song.all.select do |song_instance|
            song_instance.artist == self 
        end
    end 
    #keeps track of an artist's songs
    def add_song(song)
        song.artist = self 
    end 
    #finds or creates an artist by name maintaining uniqueness of objects by name property
    def self.find_or_create_by_name(name) 
        new_artist = Artist.all.find do |artist_instance|
            artist_instance.name == name 
        end
        if !new_artist 
            Artist.new(name)
        else 
            new_artist 
        end
    end
    #lists all of the artist's songs
    def print_songs
        song_list = Song.all.select do |song_instance|
            song_instance.artist == self 
        end
        song_list.each do |song|
            puts song.name 
        end
    end


end #of Artist class