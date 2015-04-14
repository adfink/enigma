 require './lib/date'
 require './lib/key'
 require './lib/grouper'

class Encryptor

  def initialize(args)
    @day = Date.new(args[:day])
    @starter = Key.new(args[:starter])
    @divvy = Grouper.new(args[:divvy])
  end
  def recieve (chunked_message)
    #@chunked_message = @chunks
    @chunked_message = chunked_message
    # return @chunked_message
  end

  def determine_rotation
    @starter.rotator_values
    # @day.offset
  end



end


rubix = Encryptor.new({starter: 41521, divvy: "try ruby", day: "020315"})
# day = Date.new("020315")
puts rubix.determine_rotation




# Encrypting a Message
#
# Four characters are encrypted at a time.
#               The first character is rotated forward by the "A" rotation plus the "A offset"
# The second character is rotated forward by the "B" rotation plus the "B offset"
# The third character is rotated forward by the "C" rotation plus the "C offset"
# The fourth character is rotated forward by the "D" rotation plus the "D offset"
