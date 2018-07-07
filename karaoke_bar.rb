require_relative('room.rb')
require_relative('food.rb')
require_relative('drink.rb')
require_relative('pub.rb')

class KaraokeBar < Pub

# inherits from Pub class created previously - has methods for sell_drink(drink), sell_food(food), check_if_legal(guest), check_if_drunk(guest) - drunk level is 20.

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
