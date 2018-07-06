require_relative('song.rb')

class Guest

  attr_reader :name, :age, :wallet, :favourite_song

  def initialize(name, age, wallet, favourite_song)
    @name = name # this will be a string
    @age = age # this will be an integer
    @wallet = wallet # this will be an integer
    @favourite_song = favourite_song # this will be an instance of Song class
  end

end
