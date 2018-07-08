require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')

class TestKaraokeBar < MiniTest::Test

  def setup
    # create songs
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")
    @song2 = Song.new("Song 2", "Mrs. Woman", "These are the lyrics to song 2, yo")
    @song3 = Song.new("Song 3", "Dr. Dude", "These are the lyrics to song 3, dude")
    @song4 = Song.new("Song 4", "Dame Dorah", "These are the lyrics to song 4, my friend")
    @song5 = Song.new("Song 5", "Sir Simon", "These are the lyrics to song 5, u get me")
    @song6 = Song.new("Song 6", "Ms. Lady", "These are the lyrics to song 6, woooooooo")

    # song_librarys
    @pop_songs = [@song1, @song2, @song3]
    @rock_songs = [@song4, @song5, @song6]

    # create guests
    @robbie = Guest.new("Robbie", 25, 100, @song1)
    @kirstin = Guest.new("Kirstin", 26, 50, @song2)
    @ellie = Guest.new("Ellie", 25, 200, @song1)
    @jim = Guest.new("Jim", 40, 25, @song4)
    @jemma = Guest.new("Jemma", 45, 2, @song3)
    @baby = Guest.new("Baby", 8, 10, @song1)

    # create rooms
    @pop_room = Room.new("Pop", @pop_songs, 20, 3)
    @rock_room = Room.new("Rock", @rock_songs, 15, 5)

    # room collection
    @room_collection = [@pop_room, @rock_room]

    # create food
    @pizza = Food.new("Pizza", 5, -4)
    @burger = Food.new("Burger", 6, -5)
    @nachos = Food.new("Nachos", 4, -3)

    # create drinks
    @beer = Drink.new("Beer", 3, 5)
    @wine = Drink.new("Wine", 4, 7)

    # create karaoke bar
    @the_karaoke_bar = KaraokeBar.new("The Karaoke Bar", @room_collection)

    # stock to be added to bar
    @food_to_add = {
      @pizza => 4,
      @burger => 3
    }

    @drinks_to_add = {
      @beer => 5,
      @wine => 3
    }

    # add stock to the empty bar
    @the_karaoke_bar.add_starting_stock(@food_to_add, @drinks_to_add)
  end

  def test_check_bar_has_name
    assert_equal("The Karaoke Bar", @the_karaoke_bar.name)
  end

  def test_check_bar_has_rooms
    assert_equal(@room_collection, @the_karaoke_bar.rooms)
  end

  def test_check_bar_has_till_0_at_start
    assert_equal(0, @the_karaoke_bar.till)
  end

  def test_bar_can_sell_ticket_and_increase_till
    @the_karaoke_bar.sell_ticket(@rock_room)
    assert_equal(15, @the_karaoke_bar.till)
  end

  def test_check_in_guest_changes_till_wallet_and_guests
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    assert_equal(20, @the_karaoke_bar.till)
    assert_equal(80, @robbie.wallet)
    assert_equal(1, @pop_room.guests.count)
  end

  def test_bar_can_sell_food
    @the_karaoke_bar.sell_food(@pizza)
    assert_equal(5, @the_karaoke_bar.till)
  end

  def test_bar_can_sell_drink
    @the_karaoke_bar.sell_drink(@beer)
    assert_equal(3, @the_karaoke_bar.till)
  end

  def test_bar_can_check_age_of_guest_is_legal
    verdict = @the_karaoke_bar.check_if_legal(@robbie)
    assert_equal(true, verdict)
  end

  def test_bar_can_check_age_of_guest_is_not_legal
    verdict = @the_karaoke_bar.check_if_legal(@baby)
    assert_equal(false, verdict)
  end

  def test_bar_can_check_drunkeness_of_guest_is_servable
    verdict = @the_karaoke_bar.check_if_drunk(@robbie)
    assert_equal(false, verdict)
  end

  def test_bar_can_add_starting_stock
    expected_stock = {
      food: {
        @pizza => 4,
        @burger => 3
      },
      drinks: {
        @beer => 5,
        @wine => 3
      }
    }
    assert_equal(expected_stock, @the_karaoke_bar.stock)
  end

  def test_bar_can_amend_stock_levels__existing_item
    @the_karaoke_bar.add_to_stock(@pizza, 10)
    actual = @the_karaoke_bar.stock[:food][@pizza]
    assert_equal(14, actual)
  end

  def test_bar_can_amend_stock_levels__new_item
    @the_karaoke_bar.add_to_stock(@nachos, 2)
    actual = @the_karaoke_bar.stock[:food][@nachos]
    assert_equal(2, actual)
  end

  def test_bar_can_amend_drinks_stock
    @the_karaoke_bar.add_to_stock(@wine, 20)
    actual = @the_karaoke_bar.stock[:drinks][@wine]
    assert_equal(23, actual)
  end

  def test_bar_can_check_stock__true
    verdict = @the_karaoke_bar.check_if_in_stock(@pizza)
    assert_equal(true, verdict)
  end

  def test_bar_can_check_stock__false_no_exist
    verdict = @the_karaoke_bar.check_if_in_stock(@nachos)
    assert_equal(false, verdict)
  end

  def test_bar_can_check_stock__false_exists
    @the_karaoke_bar.stock[:food][@pizza] = 0
    verdict = @the_karaoke_bar.check_if_in_stock(@pizza)
    assert_equal(false, verdict)
  end

  def test_bar_can_remove_stock_item__food
    @the_karaoke_bar.remove_stock_item(@pizza)
    assert_equal(3, @the_karaoke_bar.stock[:food][@pizza])
  end

  def test_bar_can_remove_stock_item__drink
    @the_karaoke_bar.remove_stock_item(@wine)
    assert_equal(2, @the_karaoke_bar.stock[:drinks][@wine])
  end

  def test_bar_can_check_stock_value
    assert_equal(65, @the_karaoke_bar.stock_value)
  end

  def test_check_stock_value_after_adding
    @the_karaoke_bar.add_to_stock(@pizza, 5)
    @the_karaoke_bar.add_to_stock(@nachos, 2)
    assert_equal(98, @the_karaoke_bar.stock_value)
  end

end
