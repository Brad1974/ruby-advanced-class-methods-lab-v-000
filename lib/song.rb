class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|w| w.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.artist_name = filename.split(" - ")[0]
    songnamefull = filename.split(" - ")[1]
    song.name = songnamefull.split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    song.artist_name = filename.split(" - ")[0]
    songnamefull = filename.split(" - ")[1]
    song.name = songnamefull.split(".")[0]
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end