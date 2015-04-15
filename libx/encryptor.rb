require './libx/combine_offsets'
require './libx/grouper'
require './libx/key'
require './libx/date_key'
require './libx/combine_offsets'


class Encryptor

  attr_reader :character_map
  attr_reader :chunked_message

  def initialize(message, key, date)
    @input_message = message
    @divvy = Grouper.new(message)
    @chunked_message = @divvy.chunk
    @key_in = Key.new(key)
    @date_key_in = DateKey.new(date)
    @rotation_numbers = CombineOffsets.new(@key_in, @date_key_in).offsets
    @character_map = ("a".."z").to_a + (0..9).to_a + [" ", ".", ","]
  end

  def rotation_values
    @rotation_numbers
  end

  def parse_chunked_message
    @chunked_message.size
  end


  def encrypt
    @encrypted_string = ""
    @count = 0

    @chunked_message.size.times do
      current_chunk = @chunked_message[@count]
      @count +=1
      second_count = 0
      current_chunk.size.times do
        index_of_character =  @character_map.index(current_chunk[second_count])
        new_character = @character_map[(index_of_character + @rotation_numbers[second_count]) % 39]
        @encrypted_string <<  new_character.to_s
        second_count +=1
      end

    end

    return @encrypted_string

  end



end



# rubix = Encryptor.new("Hello world. This is a sentence, that has been encrypted.", "41521", "020315")
# p rubix.encrypt
#
# output = "sv0.zo.b22syi w83oxfirmfp484yttzi w04ow03oq4p4m4yt6l0 t3j"


# require 'pry'; binding.pry    must select the appropriate element(array) within chunked message array ... every four times you increment the selector of the array within arrays

# def encrypt
#   @encrypted_string = ""
#   count = 0
#   @input_message.length.times do
#     index_of_character =  @character_map.index(@chunked_message.flatten[count])
#     new_character = @character_map[(index_of_character + @rotation_numbers[count]) % 39]
#     @encrypted_string <<  new_character.to_s
#     count +=1
#   end
#
#   return @encrypted_string
# end
