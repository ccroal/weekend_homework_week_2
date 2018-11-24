class Room

  attr_reader :number, :capcity, :entry_fee, :song_list

  def initialize(number, capcity, entry_fee, song_list)
    @number = number
    @capcity = capcity
    @entry_fee = entry_fee
    @song_list = song_list
    @till = 0
    @guests = []
  end

  def till()
    return @till
  end

  def songs_count()
    @song_list.count()
  end

  def add_song(song)
    @song_list.push(song)
  end

  def guest_count()
    @guests.count()
  end

  def add_guest_to_room(guest)
    if room_has_space? == true
      @guests.push(guest)
    end
  end

  def remove_guest_from_room(guest)
    if @guests.include?(guest)
      @guests.delete(guest)
    end
  end

  def empty_room()
    @guests.clear()
  end

  def take_entry_fee(guest, room)
    guest.pay_entry(room)
    @till += @entry_fee
  end

  def room_has_space?()
    if @capcity > @guests.count
      return true
    else
      return false
    end
  end

  def guest_check_in(guest, room)
    add_guest_to_room(guest)
    take_entry_fee(guest, room)
  end
end
