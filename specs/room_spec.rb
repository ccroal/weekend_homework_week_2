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

    @guest1 = Guest.new("Steven", 50, song1)
    @guest2 = Guest.new("Graeme", 25, song2)
    @guest3 = Guest.new("Stephanie", 70, song2)

    @room = Room.new(1, 2, 10, songs)
  end

  def test_room_has_a_number()
    assert_equal(1, @room.number)
  end

  def test_room_has_a_capacity()
    assert_equal(2, @room.capcity)
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

  def test_room_can_add_song()
    @room.add_song(@song4)
    total = @room.songs_count()
    assert_equal(4, total)
  end

  def test_room_has_guest_space()
    total_guests = @room.guest_count()
    assert_equal(0, total_guests)
  end

  def test_room_can_add_guests()
    @room.add_guest_to_room(@guest1)
    total_guests = @room.guest_count()
    assert_equal(1, total_guests)
  end

  def test_room_can_remove_guests()
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    @room.remove_guest_from_room(@guest1)
    total_guests = @room.guest_count
    assert_equal(1, total_guests)
  end

  def test_empty_room()
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    @room.empty_room()
    total_guests = @room.guest_count
    assert_equal(0, total_guests)
  end

  def test_take_entry_fee()
    @room.take_entry_fee(@guest1, @room)
    assert_equal(40, @guest1.wallet)
    assert_equal(10, @room.till)
  end

  def test_room_has_space()
    assert_equal(true, @room.room_has_space?())
  end

  def test_room_is_full()
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    @room.add_guest_to_room(@guest3)
    total_guests = @room.guest_count()
    assert_equal(2, total_guests)
    assert_equal(false, @room.room_has_space?)
  end

  def test_guest_check_in()
    @room.guest_check_in(@guest1, @room)
    assert_equal(1, @room.guest_count)
    assert_equal(40, @guest1.wallet)
    assert_equal(10, @room.till)
  end

end
