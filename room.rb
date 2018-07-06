require_relative('song.rb')
require_relative('guest.rb')
require_relative('karaoke_bar.rb')

class Room

  attr_reader :genre, :song_library, :fee, :guests, :capacity

  def initialize(genre, song_library, fee, capacity)
    @genre = genre # this will be a string.
    @song_library = song_library # this will be an array of Song class instances.
    @fee = fee # this will be an integer.
    @guests = [] # this is an empty array on creation.
    @capacity = capacity
  end

  def check_in_guest(guest, bar) # this takes the instance of Guest class and puts it into the guests array, if the guests array length is less than the capacity of the room.
    if @guests.length < @capacity && guest.wallet >= @fee
      @guests << guest
      guest.pay_entry_fee(self) # guest's wallet goes down by room fee.
      bar.sell_ticket(self) # bar increases till value by entry fee amount.
      # guest celebrates if their favourite song is on the playlist.
      if @song_library.include?(guest.favourite_song)
        guest.celebrate_fav_song
      end
    elsif @guests.length < @capacity && guest.wallet < @fee
      return "Guest does not have the funds!"
    elsif @guests.length == @capacity && guest.wallet >= @fee
      return "Room is full!"
    elsif @guests.length == @capacity && guest.wallet < @fee
      return "Room is full and guest doesn't even have the funds!"
    end
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
