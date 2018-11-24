require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class GuestTest < MiniTest::Test

  def setup()
    song1 = Song.new("Swing Life Away", "Rise Against")
    @guest = Guest.new("Donna", 100, song1)

    song2 = Song.new("Common People", "Pulp")
    song3 = Song.new("Material Girl", "Madonna")

    songs = [song1, song2, song3]

    @room = Room.new(2, 4, 5, songs)

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

  def test_guest_can_pay_reduces_wallet()
    new_balance = @guest.pay_entry(@room)
    assert_equal(95, new_balance )
  end

  def test_sufficient_funds()
    assert_equal(true, @guest.sufficient_funds(@room))
  end
end
