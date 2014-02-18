class Song
  
  @@plays = 0
  attr_reader :name, :artist, :duration
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  def play
  	@plays += 1
  	@@plays += 1
  	"This song: #@plays plays. Total #@@plays plays."
  end

  def to_s
  	"Song: #{@name}--#{@artist} (#{@duration})"
  end

  attr_writer :duration
  def durationInMinutes
  	@duration/60.0
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
end

class SongList
  MaxTime = 5*60
  def SongList.isTooLong(aSong)
  	return aSong.duration > MaxTime
  end
end
song1 = Song.new("Veeper", "Jeeper", 260)
puts "Song 1 too long? #{SongList.isTooLong(song1)}"
song2 = Song.new("The Calling", "Santana", 468)
puts SongList.isTooLong(song2)

aSong = Song.new("Bingo", "Zingo", 777)
puts aSong.to_s
puts aSong.artist
puts aSong.name
puts aSong.duration
print 'duration in minutes '; aSong.durationInMinutes
aSong.durationInMinutes = 1.0
puts aSong.duration

aSong.duration = 333
puts aSong.duration

class KS < Song
  def initialize (name, artist, duration, lyrics)
  	super(name, artist, duration)
  	@lyrics = lyrics
  end
  def to_s
  	super + " [#{@lyrics}]"
  end
end

aSong = KS.new("vonk", "spax", 333, "here come the warm jets")
puts aSong.to_s

s1 = Song.new("Song1", "Artist1", 234)
s2 = Song.new("Song2", "Artist2", 345)
puts s1.play
puts s2.play
puts s1.play
puts s1.play

class Logger
  private_class_method :new
  @@logger = nil
  def Logger.create
  	@@logger = new unless @@logger
  	@@logger
  end
 end

 puts Logger.create.object_id
 puts Logger.create.object_id
 

 class SongList
 	attr_accessor :songs
   def initialize
     @songs = []
   end
   def append(aSong)
     @songs.push(aSong)
     self
   end
   def deleteFirst
     @songs.shift
   end
   def deleteLast
   	 @songs.pop
   end
   def [](key)
     return @songs[key] if key.kind_of?(Integer)
     return @songs.find { |aSong| aSong.name == key }
   end
 end
list = SongList.new
list.append(Song.new('title1', 'artist1', 1)).
  append(Song.new('title2', 'artist2', 2)).
  append(Song.new('title3', 'artist3', 3)).
  append(Song.new('title4', 'artist4', 4))
puts list.songs
puts "now removing"
puts list.deleteFirst
puts "is gone, here's whats left"
puts list.songs
puts "now for some key indexing"
puts list[0]
puts list[1]