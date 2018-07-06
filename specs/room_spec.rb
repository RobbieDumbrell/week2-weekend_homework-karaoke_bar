require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')

class TestRoom < MiniTest::Test

  def setup
    # create songs
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")
    @song2 = Song.new("Song 2", "Mrs. Woman", "These are the lyrics to song 2, yo")
    @song3 = Song.new("Song 3", "Dr. Dude", "These are the lyrics to song 3, dude")
    @song4 = Song.new("Song 4", "Dame Dorah", "These are the lyrics to song 4, my friend")

    # a song_library
    @pop_songs = [@song1, @song2, @song3]

    # create guests
    @robbie = Guest.new("Robbie", 25, 100, @song1)
    @kirstin = Guest.new("Kirstin", 26, 50, @song2)
    @ellie = Guest.new("Ellie", 25, 200, @song1)
    @jim = Guest.new("Jim", 40, 25, @song4)
    @jemma = Guest.new("Jemma", 45, 2, @song3)

    # create room
    @pop_room = Room.new("Pop", @pop_songs, 20, 3)

    # create bar
    @the_karaoke_bar = KaraokeBar.new("The Karaoke Bar", [@pop_room])
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

  def test_room_has_capacity
    assert_equal(3, @pop_room.capacity)
  end

  def test_room_can_check_in_guest
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    assert_equal([@robbie], @pop_room.guests)
  end

  def test_room_can_check_in_multiple_guests
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    @pop_room.check_in_guest(@kirstin, @the_karaoke_bar)
    assert_equal([@robbie, @kirstin], @pop_room.guests)
  end

  def test_room_rejects_if_reached_capacity
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    @pop_room.check_in_guest(@kirstin, @the_karaoke_bar)
    @pop_room.check_in_guest(@ellie, @the_karaoke_bar)
    assert_equal(3, @pop_room.guests.count)
    @pop_room.check_in_guest(@jim, @the_karaoke_bar)
    assert_equal(3, @pop_room.guests.count)
  end

  def test_room_rejects_if_guest_can_not_afford
    @pop_room.check_in_guest(@jemma, @the_karaoke_bar)
    assert_equal(0, @pop_room.guests.count)
    assert_equal(2, @jemma.wallet)
  end

  def test_room_rejects_if_reached_capacity_and_guest_can_not_afford
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    @pop_room.check_in_guest(@kirstin, @the_karaoke_bar)
    @pop_room.check_in_guest(@ellie, @the_karaoke_bar)
    assert_equal(3, @pop_room.guests.count)
    @pop_room.check_in_guest(@jemma, @the_karaoke_bar)
    assert_equal(3, @pop_room.guests.count)

  end

  def test_guest_wallet_decreases_when_checking_in
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    assert_equal(1, @pop_room.guests.count)
    assert_equal(80, @robbie.wallet)
  end

  def test_room_can_check_out_guest
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
    assert_equal([@robbie], @pop_room.guests)
    @pop_room.check_out_guest(@robbie)
    assert_equal([], @pop_room.guests)
  end

  def test_room_can_check_out_guest__guest_not_there
    @pop_room.check_in_guest(@robbie, @the_karaoke_bar)
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

  def test_guest_celebrates_if_room_has_fav_song
    assert_equal("Whooooo! I love that song!", @pop_room.check_in_guest(@robbie, @the_karaoke_bar))
  end

  def test_guest_does_not_celebrate_if_room_has_no_fav_song
    assert_nil(@pop_room.check_in_guest(@jim, @the_karaoke_bar))
  end

end
