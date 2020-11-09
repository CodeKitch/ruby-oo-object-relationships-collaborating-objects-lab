class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
    end
    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = split_name[1]
        artist = split_name[0]
        new_copy = self.new(song)
        new_copy.artist_name = artist
        new_copy
         
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end
