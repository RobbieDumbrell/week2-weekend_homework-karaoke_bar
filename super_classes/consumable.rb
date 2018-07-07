class Consumable

  attr_reader :name, :price, :drunkeness_modifier

  def initialize(name, price, drunkeness_modifier)
    @name = name # this will be a string
    @price = price # this will be an integer
    @drunkeness_modifier = drunkeness_modifier # this will be an integer
  end

end
