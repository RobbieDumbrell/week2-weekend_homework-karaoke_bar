require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../food.rb')

# THIS IS COPIED IN FROM PUB LAB ('../../week_02/day_3/pub_lab/pub.rb') - to try out inheritance from the pub class created there to the karaoke bar.

class Pub

  attr_reader :name, :till, :drinks, :food, :stock

  def initialize(name, till, drinks, food, stock)
    @name = name # this will be a string
    @till = till # this will be an integer
    @drinks = drinks # this will be an array
    @food = food # this will be an array
    @stock = stock #this will be a hash
  end

  def sell_drink(drink)
    @till += drink.price # pub increaes its own till when it sells a drink. (customer will request this to happen).
  end

  def sell_food(food)
    @till += food.price
  end


  def check_if_legal(customer)
    return true if customer.age >= 18
    return false if customer.age < 18
  end

  def check_if_drunk(customer)
    return true if customer.drunkeness >= 20
    return false if customer.drunkeness < 20
  end

  # def check_if_in_stock(drink)
  #   if @stock.has_key?(drink) == true
  #     return true if @stock[drink] > 0
  #     return false if @stock[drink] == 0
  #   else
  #     return false
  #   end
  # end

  # def check_stock_value
  #   # to be done
  #   stock_value = 0
  #   for drink in @stock
  #     stock_value_of_drink = @stock[drink] * drink.price
  #     stock_value += stock_value_of_drink
  #   end
  #   return stock_value
  # end

end
