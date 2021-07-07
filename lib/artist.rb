
class Artist

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        self.all.find {|artist_instance| artist_instance.name == name} || Artist.new(name)
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end


end