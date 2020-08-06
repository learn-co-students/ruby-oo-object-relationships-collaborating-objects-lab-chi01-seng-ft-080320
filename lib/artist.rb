class Artist

    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 

        Artist.all << self 
    end

    def self.all 
        @@all 
    end

    def songs 
        Song.all.select do |song_instance|
            song_instance.artist == self 
        end
    end 

    def add_song(song)
        song.artist = self 
    end 

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

    def print_songs
        song_list = Song.all.select do |song_instance|
            song_instance.artist == self 
        end
        song_list.each do |song|
            puts song.name 
        end
    end


end #of Artist class