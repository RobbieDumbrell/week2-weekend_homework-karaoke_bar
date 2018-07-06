require_relative('room.rb')

class KaraokeBar

  attr_reader :name, :rooms, :till

  def initialize(name, rooms)
    @name = name # this will be a string.
    @rooms = rooms # this will be an array of Room class instances.
    @till = 0 # till starts life at 0.
  end

  def sell_ticket(room)
    @till += room.fee
  end

end
