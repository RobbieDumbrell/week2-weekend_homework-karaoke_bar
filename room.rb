require_relative('song.rb')
require_relative('guest.rb')

class Room

  attr_reader :genre, :song_library, :fee, :guests

  def initialize(genre, song_library, fee,)
    @genre = genre # this will be a string
    @song_library = song_library # this will be an array of Song class instances
    @fee = fee # this will be an integer
    @guests = [] # this is an empty array on creation
  end

  def check_in_guest(guest) # this takes the instance of Guest class and puts it into the guests array.
    @guests << guest
    @guests.flatten!
  end

  def check_out_guest(guest) # this takes the instance of Guest class and removes it from the guest array if in there, otherwise does nothing.
    @guests.delete(guest)
  end

  def add_song(song) # this takes an instance of the Song class and adds it to the song_library array.
    @song_library << song
  end

  def remove_song(song) # this takes an instance of the Song class and removes it from the song_library array if in there, otherwise does nothing.
    @song_library.delete(song)
  end

end
