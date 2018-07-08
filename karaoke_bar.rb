require_relative('room.rb')
require_relative('food.rb')
require_relative('drink.rb')
require_relative('super_classes/pub.rb')

class KaraokeBar < Pub

  # inherits from Pub class created previously - has methods for sell_drink(drink), sell_food(food), check_if_legal(guest), check_if_drunk(guest) - drunk level is 20.

  attr_reader :name, :rooms, :till, :stock

  def initialize(name, rooms)
    @name = name # this will be a string.
    @rooms = rooms # this will be an array of Room class instances.
    @till = 0 # till starts life at 0.
    @stock = {food: 0, drinks: 0} # this is a hash.
  end

  def sell_ticket(room)
    @till += room.fee
  end

  def add_starting_stock(food_to_add, drinks_to_add) # arguments as hashes.
    @stock[:food] = food_to_add # adds to stock hash
    @stock[:drinks] = drinks_to_add # adds to stock hash
  end

  def add_to_stock(consumable, stock_level) # adds stock to specified consumable (can be a new one) by the stock_level amount.
    if consumable.is_a?(Food)

      if @stock[:food].include?(consumable) == true
        @stock[:food][consumable] += stock_level

      elsif @stock[:food].include?(consumable) == false
        @stock[:food][consumable] = stock_level
      end

    elsif consumable.is_a?(Drink)

      if @stock[:drinks].include?(consumable) == true
        @stock[:drinks][consumable] += stock_level

      elsif @stock[:drinks].include?(consumable) == false
        @stock[:drinks][consumable] = stock_level

      end
    end
  end

  def check_if_in_stock(consumable) # returns true or false if a specified consumable item is in stock (is in the stock hash and has a value of more than 0).
    if consumable.is_a?(Food)
      if @stock[:food].include?(consumable) == true && @stock[:food][consumable] > 0
        return true
      elsif @stock[:food].include?(consumable) == true && @stock[:food][consumable] = 0
        return false
      elsif @stock[:food].include?(consumable) == false
        return false
      end
    end

    if consumable.is_a?(Drink)
      if @stock[:drinks].include?(consumable) == true && @stock[:drinks][consumable] > 0
        return true
      elsif @stock[:drinks].include?(consumable) == true && @stock[:drinks][consumable] = 0
        return false
      elsif @stock[:drinks].include?(consumable) == false
        return false
      end
    end

  end

  def remove_stock_item(consumable) # removes stock item by 1.
    if consumable.is_a?(Food)
      @stock[:food][consumable] -= 1

    elsif consumable.is_a?(Drink)
      @stock[:drinks][consumable] -= 1

    end
  end



end
