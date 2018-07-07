require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    # create song
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")

    # create guest
    @robbie = Guest.new("Robbie", 25, 100, @song1)

    # create room
    @pop_room = Room.new("Pop", [@song1], 20, 3)
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

end
