require 'pry'
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
    r = Song.new
    @@all << r
    r
  end

  def self.new_by_name(title)
    r = Song.new
    r.name = title
    r
  end

  def self.create_by_name(title)
    song = Song.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    #binding.pry
    @@all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    #binding.pry
    # song = self.find_by_name(title)
    #
    # if song.nil?
    #   # binding.pry
    #   self.create_by_name(title)
    # else
    #   song
    # end

    self.find_by_name(title) || self.create_by_name(title)

  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(fileName)
    song = Song.new
    arrayMusic = fileName.split(" - ")
    song.artist_name = arrayMusic[0]
    song.name = arrayMusic[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(fileName)
    song = Song.create
    arrayMusic = fileName.split(" - ")
    song.artist_name = arrayMusic[0]
    song.name = arrayMusic[1].chomp(".mp3")
    song
    #can call the function above
  end
  def self.destroy_all
    self.all.clear
  end
end
 # r = Song.create_by_name("No Hands")
 # v = Song.create_by_name("Waves")
 # Song.alphabetical
