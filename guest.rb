require_relative('song.rb')
require_relative('room.rb')
require_relative('drink.rb')
require_relative('food.rb')
require_relative('karaoke_bar.rb')

class Guest

  attr_reader :name, :age, :wallet, :favourite_song, :drunkeness, :food_in_stomach, :drinks_in_stomach

  def initialize(name, age, wallet, favourite_song)
    @name = name # this will be a string.
    @age = age # this will be an integer.
    @wallet = wallet # this will be an integer.
    @favourite_song = favourite_song # this will be an instance of Song class.
    @drunkeness = 0 # assumes all guests start at 0 drunkeness
    @food_in_stomach = []
    @drinks_in_stomach = []
  end

  def pay_entry_fee(room) # wallet decreases by room fee - will be called in check_in_guest method in room.
    @wallet -= room.fee
  end

  def celebrate_fav_song # returns celebration string that represents a guest - called in check_in_guest method in room.
    return "Whooooo! I love that song!"
  end

  def buy_food(food, bar)
    if @wallet >= food.price # if guest has enough money.
      bar.sell_food(food) # this increases the till of the bar.
      @wallet -= food.price # this decreases the guest's wallet.
      @food_in_stomach << food # this puts food in guest's stomach.
      @drunkeness += food.drunkeness_modifier # this decreases guest drunkeness.
      if @drunkeness < 0
        @drunkeness = 0
      end
    end
    if @wallet < food.price
      return "Guest does not have the funds!"
    end
  end

  def buy_drink(drink, bar)
    if bar.check_if_drunk(self) == false && bar.check_if_legal(self) == true && @wallet >= drink.price # only occurs if guest is old enough, not drunk (below 20) and has enough money in wallet.
      bar.sell_drink(drink) # this increases the till of the bar.
      @wallet -= drink.price # this decreases the guest's wallet.
      @drinks_in_stomach << drink # this puts drink in guest's stomach.
      @drunkeness += drink.drunkeness_modifier # this increases guest's drunkeness.
    end
    if bar.check_if_drunk(self) == true
      return "Guest is too drunk!"
    end
    if bar.check_if_legal(self) == false
      return "Guest is too young!"
    end
    if @wallet < drink.price
      return "Guest does not have the funds!"
    end
  end



end
