class MP3Importer
    
    attr_reader :path

    def initialize (path)
        @path = path
    end

    def files
        list = Dir["#{@path}/*.mp3"]
        @@music_files = list.map do |file|
         file[21..-1]
        end
     end

     def import 
        @@music_files.each do |file|
            Song.new_by_filename(file)
        end

    end
end