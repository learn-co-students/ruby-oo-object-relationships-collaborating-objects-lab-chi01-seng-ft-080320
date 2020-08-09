class MP3Importer
    @@all = []

    attr_accessor :name, :path

    def initialize(path)
        @path = path
    end

    def files
        file_list = Dir["#{@path}/*.mp3"]
        @@all = file_list.map do |file|
        file[21..-1]
       end
    end

    def import
    @@all.each do |file_name|
       Song.new_by_filename(file_name)
       end
    end

end
