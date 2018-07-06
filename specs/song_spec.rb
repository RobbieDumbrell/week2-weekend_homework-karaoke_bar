require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Song 1", "Mr. Man", "These are the lyrics to song 1")
  end

  def test_song_has_name
    assert_equal("Song 1", @song1.name)
  end

  def test_song_has_artist
    assert_equal("Mr. Man", @song1.artist)
  end

  def test_song_has_lyrics
    assert_equal("These are the lyrics to song 1", @song1.lyrics)
  end

end
