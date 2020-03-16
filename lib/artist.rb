require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
  
  extend Memorable::ClassMethods
  include Paramable::InstanceMethods
  include Memorable::InstanceMethods

  @@artists = []

  def initialize
    super
    @songs = []
  end

  #finds an Artist instance by matching name
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  #returns an array of all artist instances
  def self.all
    @@artists
  end

  # #clears the array of all artists so its empty
  # def self.reset_all
  #   self.all.clear
  # end

  # #returns number of artist instances
  # def self.count
  #   self.all.count
  # end

  #adds to the song array and makes artist self
  def add_song(song)
    @songs << song
    song.artist = self
  end

  #adds multiple songs to songs array
  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  #makes name lowercase and removes spaces and - ? ? 
  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
