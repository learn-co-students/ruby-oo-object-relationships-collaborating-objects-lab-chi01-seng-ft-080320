


class MP3Importer

    attr_accessor :path

    @@all = []

    def initialize (file_path)
        @path = file_path
        self.class.all << self
    end

    def self.all
        @@all
    end

    def files
        file_path = Dir.entries("spec/fixtures/mp3s")
        file_path.delete(".")
        file_path.delete("..")
        file_path
    end

    def import
        file_path = files
        file_path.each do |individual_file|
            song = Song.new_by_filename(individual_file)
        end 
    end
end
