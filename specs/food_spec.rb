require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup
    @pizza = Food.new("Pizza", 5, -5)
  end

  def test_food_has_name
    assert_equal("Pizza", @pizza.name)
  end

  def test_food_has_price
    assert_equal(5, @pizza.price)
  end

  def test_food_has_drunkeness_modifier
    assert_equal(-5, @pizza.drunkeness_modifier)
  end

end
