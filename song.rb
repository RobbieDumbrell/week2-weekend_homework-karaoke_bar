class Song

  attr_reader :name, :artist, :lyrics

  def initialize(name, artist, lyrics)
    @name = name # this will be a string.
    @artist = artist # this will be a string.
    @lyrics = lyrics # this will be a string.
  end

end
