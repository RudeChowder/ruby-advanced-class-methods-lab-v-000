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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    named_song = Song.new
    named_song.name=(name)
    named_song
  end

  def self.create_by_name(name)
    named_created_song = new_by_name(name)
    named_created_song.save
    named_created_song
  end

  def self.find_by_name(search)
    @@all.find {|song| song.name == search}
  end

  def self.find_or_create_by_name(name)
    existing = find_by_name(name)
    if existing
      return existing
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    song = new_by_name("#{split_filename[1].chomp(".mp3")}")
    song.artist_name=("#{split_filename[0]}")
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
