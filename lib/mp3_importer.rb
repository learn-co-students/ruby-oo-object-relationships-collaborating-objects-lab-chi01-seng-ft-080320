class MP3Importer

    attr_accessor :name, :path 


    def initialize(path)
        @path = path 
    end

    def files
       file_list = Dir["#{@path}/*.mp3"]
       @@music_files = file_list.map do |file|
        file[21..-1]
       end
    end

    def import #Action Bronson - Larry Csonka - indie.mp3

        @@music_files.each do |file|
            Song.new_by_filename(file)
        end

    end


end #of MP3Importer class 21