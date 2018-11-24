class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def can_whoo()
    return "Whoo!"
  end

  def pay_entry(room)
    if sufficient_funds(room) == true
      @wallet -= room.entry_fee
    end
  end

  def sufficient_funds(room)
    @wallet >= room.entry_fee
  end

  def favourite_song_celebration(room)
    if room.song_list.include?(@favourite_song)
      can_whoo
      else false
    end
  end
end
