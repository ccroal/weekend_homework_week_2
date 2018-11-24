require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class GuestTest < MiniTest::Test

  def setup()
    favourite_song = Song.new("Swing Life Away", "Rise Against")
    @guest = Guest.new("Donna", 100, favourite_song)
  end

  def test_guest_has_name()
    assert_equal("Donna", @guest.name)
  end

  def test_guest_has_wallet()
    assert_equal(100, @guest.wallet)
  end

  def test_guest_has_favourite_song()
    assert_equal("Swing Life Away", @guest.favourite_song.title)
  end

  def test_guest_can_whoo()
    assert_equal("Whoo!", @guest.can_whoo)
  end
end
