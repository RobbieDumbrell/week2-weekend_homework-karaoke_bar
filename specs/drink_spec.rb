require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class TestDrink < MiniTest::Test

  def setup
    @beer = Drink.new("Beer", 3, 4)
  end

  def test_drink_has_name
    assert_equal("Beer", @beer.name)
  end

  def test_drink_has_price
    assert_equal(3, @beer.price)
  end

  def test_drink_has_drunkeness_modifier
    assert_equal(4, @beer.drunkeness_modifier)
  end

end
