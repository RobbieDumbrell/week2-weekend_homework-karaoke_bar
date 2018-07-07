require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    # create song
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")

    # create guests
    @robbie = Guest.new("Robbie", 25, 100, @song1)
    @john = Guest.new("John", 16, 4, @song1)
    @martin = Guest.new("Martin", 19, 2, @song1)
    @kevin = Guest.new("Kevin", 14, 1, @song1)

    # create food
    @pizza = Food.new("Pizza", 5, -4)

    # create drink
    @beer = Drink.new("Beer", 4, 5)

    # create room
    @pop_room = Room.new("Pop", [@song1], 20, 3)

    # create bar
    @the_karaoke_bar = KaraokeBar.new("The Karaoke Bar", [@pop_room])
  end

  def test_guest_has_name
    assert_equal("Robbie", @robbie.name)
  end

  def test_guest_has_age
    assert_equal(25, @robbie.age)
  end

  def test_guest_has_wallet
    assert_equal(100, @robbie.wallet)
  end

  def test_guest_has_fav_song
    assert_equal(@song1, @robbie.favourite_song)
  end

  def test_guest_can_pay_entry_fee
    @robbie.pay_entry_fee(@pop_room)
    assert_equal(80, @robbie.wallet)
  end

  def test_guest_has_0_drunkeness_at_start
    assert_equal(0, @robbie.drunkeness)
  end

  def test_guest_starts_with_0_food_in_stomach
    assert_equal(0, @robbie.food_in_stomach.count)
  end

  def test_guest_starts_with_0_drinks_in_stomach
    assert_equal(0, @robbie.food_in_stomach.count)
  end

  def test_guest_can_buy_food_and_all_actions_happen
    @robbie.buy_food(@pizza, @the_karaoke_bar)
    assert_equal(95, @robbie.wallet)
    assert_equal(5, @the_karaoke_bar.till)
    assert_equal(1, @robbie.food_in_stomach.count)
    assert_equal(0, @robbie.drunkeness)
  end

  def test_guest_can_not_buy_food_if_no_funds
    @john.buy_food(@pizza, @the_karaoke_bar)
    assert_equal(4, @john.wallet)
    assert_equal(0, @the_karaoke_bar.till)
    assert_equal(0, @john.food_in_stomach.count)
    assert_equal(0, @john.drunkeness)
  end

  def test_guest_can_buy_drink_and_all_actions_happen
    @robbie.buy_drink(@beer, @the_karaoke_bar)
    assert_equal(96, @robbie.wallet)
    assert_equal(4, @the_karaoke_bar.till)
    assert_equal(1, @robbie.drinks_in_stomach.count)
    assert_equal(5, @robbie.drunkeness)
  end

  def test_guest_can_not_buy_drink_if_underage
    @john.buy_drink(@beer, @the_karaoke_bar)
    assert_equal(4, @john.wallet)
    assert_equal(0, @the_karaoke_bar.till)
    assert_equal(0, @john.drinks_in_stomach.count)
    assert_equal(0, @john.drunkeness)
  end

  def test_guest_can_not_buy_drink_if_too_drunk
    4.times do @robbie.buy_drink(@beer, @the_karaoke_bar)
    end
    @robbie.buy_drink(@beer, @the_karaoke_bar)
    assert_equal(84, @robbie.wallet)
    assert_equal(16, @the_karaoke_bar.till)
    assert_equal(4, @robbie.drinks_in_stomach.count)
    assert_equal(20, @robbie.drunkeness)
  end

  def test_guest_can_not_buy_drink_if_no_funds
    @martin.buy_drink(@beer, @the_karaoke_bar)
    assert_equal(2, @martin.wallet)
    assert_equal(0, @the_karaoke_bar.till)
    assert_equal(0, @martin.drinks_in_stomach.count)
    assert_equal(0, @martin.drunkeness)
  end

  def test_guest_can_not_buy_drink_if_all_scenarios
    @kevin.buy_drink(@beer, @the_karaoke_bar)
    assert_equal(1, @kevin.wallet)
    assert_equal(0, @the_karaoke_bar.till)
    assert_equal(0, @kevin.drinks_in_stomach.count)
    assert_equal(0, @kevin.drunkeness)
  end

end
