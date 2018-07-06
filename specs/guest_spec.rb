require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")

    @robbie = Guest.new("Robbie", 25, 100, @song1)
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

end
