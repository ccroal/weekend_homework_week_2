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
    @song3 = Song.new("Material Girl", "Madonna")

    songs = [song1, song2,]

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

  def test_celebrate_favourite_song_in_room()
    assert_equal("Whoo!", @guest.favourite_song_celebration(@room))
  end

  def test_celebrate_favourite_song_not_in_room()
    guest2 = Guest.new("David", 100, @song3)
    assert_equal(false, guest2.favourite_song_celebration(@room))
  end
end
