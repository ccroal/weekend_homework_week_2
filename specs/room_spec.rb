require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup()
    song1 = Song.new("Common Peopl", "Pulp")
    song2 = Song.new("Material Girl", "Madonna")
    song3 = Song.new("Wait and Bleed", "Slipknot")
    @song4 = Song.new("Hey Jude", "The Beatles")

    songs = [song1, song2, song3]

    @guest = Guest.new("Steven", 50, song1)

    @room = Room.new(1, 5, 10, songs)
  end

  def test_room_has_a_number()
    assert_equal(1, @room.number)
  end

  def test_room_has_a_capacity()
    assert_equal(5, @room.capcity)
  end

  def test_room_has_entry_fee()
    assert_equal(10, @room.entry_fee)
  end

  def test_room_has_a_till()
    assert_equal(0, @room.till)
  end

  def test_room_has_songs()
    total = @room.songs_count()
    assert_equal(3, total)
  end

  def test_room_has_guest_space()
    total_guests = @room.guest_count()
    assert_equal(0, total_guests)
  end

  def test_room_can_add_guests()
    @room.add_guest_to_room(@guest)
    total_guests = @room.count()
    assert_equal(1, total_guests)
  end
end
