require('minitest/autorun')
require('minitest/rg')
require_relative('../consumable.rb')

class TestConsumable < MiniTest::Test

  def setup
    @something = Consumable.new("Something", 20, 10)
  end

  def test_consumable_has_name
    assert_equal("Something", @something.name)
  end

  def test_consumable_has_price
    assert_equal(20, @something.price)
  end

  def test_consumable_has_drunkeness_modifier
    assert_equal(10, @something.drunkeness_modifier)
  end

end
