require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

  def setup()
    @song = Song.new("Sympathy for the Devil", "The Rolling Stones")
  end

  def test_song_has_name()
    assert_equal("Sympathy for the Devil", @song.title)
  end

  def test_song_has_artist()
    assert_equal("The Rolling Stones", @song.artist)
  end

end
