require_relative('song.rb')
require_relative('room.rb')

class Guest

  attr_reader :name, :age, :wallet, :favourite_song, :drunkeness

  def initialize(name, age, wallet, favourite_song)
    @name = name # this will be a string.
    @age = age # this will be an integer.
    @wallet = wallet # this will be an integer.
    @favourite_song = favourite_song # this will be an instance of Song class.
    @drunkeness = 0 # assumes all guests start at 0 drunkeness
  end

  def pay_entry_fee(room) # wallet decreases by room fee - will be called in check_in_guest method in room.
    @wallet -= room.fee
  end

  def celebrate_fav_song # returns celebration string that represents a guest - called in check_in_guest method in room.
    return "Whooooo! I love that song!"
  end

end
