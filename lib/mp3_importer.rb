class MP3Importer

    attr_accessor :name, :path 

    #accepts a file path to parse mp3 files from
    def initialize(path)
        @path = path 
    end
    #loads and normalizes the filename to just the mp3 filename with no path
    def files
       file_list = Dir["#{@path}/*.mp3"]
       @@music_files = file_list.map do |file|
        file[21..-1]
       end
    end
    #imports the files into the library by creating songs from a filename
    def import 

        @@music_files.each do |file_name|
            Song.new_by_filename(file_name)
        end

    end


end #of MP3Importer class 21