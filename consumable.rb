class Consumable

  attr_reader :name, :price, :drunkeness_modifier

  def initialize(name, price, drunkeness_modifier)
    @name = name
    @price = price
    @drunkeness_modifier = drunkeness_modifier
  end

end
