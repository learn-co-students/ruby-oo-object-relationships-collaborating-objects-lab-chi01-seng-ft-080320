
class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name 
        @artist = artist 

        Song.all << self 
    end 

    def self.all 
        @@all 
    end

    #file_name = 'Michael Jackson - Black or White - pop.mp3'
    #new_instance = Song.new_by_filename(file_name)
    #expect(new_instance.name).to eq('Black or White')
    def self.new_by_filename(file_name) 
        file_array = file_name.split(" - ")
        song = file_array[1]
        artist = file_array[0]
        new_song = Song.new(song)
        new_song.artist_name = artist 
        new_song  
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end #of Song class