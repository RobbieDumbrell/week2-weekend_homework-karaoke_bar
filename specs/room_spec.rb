require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')

class TestRoom < MiniTest::Test

  def setup
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")
    @song2 = Song.new("Song 2", "Mrs. Woman", "These are the lyrics to song 2, yo")
    @song3 = Song.new("Song 3", "Dr. Dude", "These are the lyrics to song 3, dude")
    @song4 = Song.new("Song 4", "Dame Dorah", "These are the lyrics to song 4, my friend")

    @pop_songs = [@song1, @song2, @song3]

    @robbie = Guest.new("Robbie", 25, 100, @song1)
    @kirstin = Guest.new("Kirstin", 26, 50, @song2)

    @pop_room = Room.new("Pop", @pop_songs, 20)
  end

  def test_room_has_genre
    assert_equal("Pop", @pop_room.genre)
  end

  def test_room_has_song_library
    assert_equal(@pop_songs, @pop_room.song_library)
  end

  def test_room_starts_with_no_guests
    assert_equal([], @pop_room.guests)
  end

  def test_room_has_fee
    assert_equal(20, @pop_room.fee)
  end

  def test_room_can_check_in_guest
    @pop_room.check_in_guest(@robbie)
    assert_equal([@robbie], @pop_room.guests)
  end

  def test_room_can_check_in_multiple_guests
    @pop_room.check_in_guest([@robbie, @kirstin])
    assert_equal([@robbie, @kirstin], @pop_room.guests)
  end

  def test_room_can_check_out_guest
    @pop_room.check_in_guest(@robbie)
    assert_equal([@robbie], @pop_room.guests)
    @pop_room.check_out_guest(@robbie)
    assert_equal([], @pop_room.guests)
  end

  def test_room_can_check_out_guest__guest_not_there
    @pop_room.check_in_guest(@robbie)
    assert_equal([@robbie], @pop_room.guests)
    @pop_room.check_out_guest(@kirstin)
    assert_equal([@robbie], @pop_room.guests)
  end

  def test_room_can_add_songs_to_song_library
    @pop_room.add_song(@song4)
    assert_equal([@song1, @song2, @song3, @song4], @pop_room.song_library)
  end

  def test_room_can_remove_song_from_song_library
    @pop_room.remove_song(@song3)
    assert_equal([@song1, @song2], @pop_room.song_library)
  end

end
