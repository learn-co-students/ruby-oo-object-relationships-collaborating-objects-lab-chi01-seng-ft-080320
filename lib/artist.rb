

require "pry"

class Artist 

    @@all = []

    attr_accessor :name
    attr_reader :artist

    def initialize (name)
        @name = name
        self.class.all << self
    end 

    def self.all
        @@all
    end

    def songs
        Song.all.select do |individual_songs|
            individual_songs.artist == self
        end 
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if (self.all.find{ |song| song.name == name})
            self.all.find{ |song| song.name == name}
        else 
            Artist.new(name)
        end 
    end

    def print_songs
        song_arr = Song.all.select do |individual_song|
                individual_song.artist == self
        end 
        print_output = ''
        song_arr.each do |value|
            print_output += value.name + "\n"
        end 
        puts print_output
    end


    
end 
