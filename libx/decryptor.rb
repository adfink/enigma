
# require './libx/combine_offsets'
require './libx/grouper'
# require './libx/key'
# require './libx/date_key'
# require './libx/combine_offsets'
require './libx/encryptor'


class Decryptor
  attr_reader :garbled_message
  attr_reader :rotator_values
  def initialize(outputs_from_encryptor)
    @garbled_message = outputs_from_encryptor[0]
    @rotator_values = outputs_from_encryptor[1]
    @character_map = ("a".."z").to_a + ["0", "1", "2","3", "4", "5","6", "7", "8","9"] + [" ", ".", ","]

  end

  def chunk
   @garbled_chunked_message = @garbled_message.chars.each_slice(4).map { |slice| slice }
  end

  # def decrypt
  #     @decrypted_string = ""
  #     @count = 0
  #
  #     @garbled_chunked_message.size.times do
  #       current_chunk = @garbled_chunked_message[@count]
  #       p current_chunk
  #       p current_chunk.size
  #       @count +=1
  #       second_count = 0
  #       current_chunk.size.times do
  #         index_of_character =  @character_map.index(current_chunk[second_count])
  #        # p @character_map.index("4")
  #         p index_of_character
  #         new_character = @character_map[(index_of_character - @rotator_values[second_count]) % 39]
  #        p new_character
  #         @decrypted_string <<  new_character.to_s
  #         p @decrypted_string
  #         second_count +=1
  #       end
  #     end
  #    p @decrypted_string
  #     return @decrypted_string
  #
  #   end

  def decrypt
    @decrypted_string = ""
    @count = 0
    @garbled_chunked_message.size.times do
      current_chunk = @garbled_chunked_message[@count]
      @count +=1
      second_count = 0
      current_chunk.size.times do
        index_of_character =  @character_map.index(current_chunk[second_count])
        new_character = @character_map[(index_of_character - @rotator_values[second_count]) % 39]
        @decrypted_string <<  new_character.to_s
        second_count +=1
      end
    end
    return @decrypted_string

  end

  end

rubix = Encryptor.new("try ruby", "41521","020315" )
solver = Decryptor.new(rubix.outputs_for_decryptor)
p solver.garbled_message
p solver.chunk
p solver.decrypt





#
#   attr_reader :character_map
#   attr_reader :chunked_message
#
#   def initialize(message, key, date)
#     @input_message = message
#     @divvy = Grouper.new(message)
#     @chunked_message = @divvy.chunk
#     @key_in = Key.new(key)
#     @date_key_in = DateKey.new(date)
#     @rotation_numbers = CombineOffsets.new(@key_in, @date_key_in).offsets
#     @character_map = ("a".."z").to_a + (0..9).to_a + [" ", ".", ","]
#   end
#
#
# end

