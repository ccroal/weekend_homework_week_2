class Room

  attr_reader :number, :capcity, :entry_fee

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
    @guests.push(guest)
  end

  
end
