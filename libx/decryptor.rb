
require './libx/combine_offsets'
require './libx/grouper'
# require './libx/key'
# require './libx/date_key'
# require './libx/combine_offsets'
require './libx/encryptor'


class Decryptor
  attr_reader :input_message
  attr_reader :rotator_values
  attr_reader :garbled_chunked_message
  attr_reader :rotation_numbers
  # def initialize(outputs_from_encryptor)
  #   @garbled_message = outputs_from_encryptor[0]
  #   @rotator_values = outputs_from_encryptor[1]
  #   @character_map = ("a".."z").to_a + ["0", "1", "2","3", "4", "5","6", "7", "8","9"] + [" ", ".", ","]
  # end

  def initialize(message, key, date)
    @input_message = message
    @divvy = Grouper.new(message)
    @garbled_chunked_message = @divvy.chunk
    @key_in = Key.new(key)
    @date_key_in = DateKey.new(date)
    @rotation_numbers = CombineOffsets.new(@key_in, @date_key_in).offsets
    @character_map = ("a".."z").to_a + ["0", "1", "2","3", "4", "5","6", "7", "8","9"] + [" ", ".", ","]
  end


  # def chunk
  #   # I must make sure that this method is called and run BEFORE calling decrypt... otherwise garbled_chunked_message is nil
  #   @garbled_chunked_message = @garbled_message.chars.each_slice(4).map { |slice| slice }
  # end

  def decrypt
    # require 'pry' ; binding.pry
    @decrypted_string = ""
    @count = 0
    @garbled_chunked_message.size.times do
      current_chunk = @garbled_chunked_message[@count]
      @count +=1
      second_count = 0
      current_chunk.size.times do
        index_of_character =  @character_map.index(current_chunk[second_count])
        new_character = @character_map[index_of_character - @rotation_numbers[second_count] % 39]
        @decrypted_string <<  new_character.to_s
        second_count +=1
      end
    end
    return @decrypted_string

  end


  end

solver = Decryptor.new("48ax2.ql", "41521","020315")
# p solver.garbled_message
p solver.decrypt










# solver = Decryptor.new(["sv0.zo.b22syi w83oxfirmfp484yttzi w04ow03oq4p4m4yt6l0 t3j", [50, 17, 54, 26]]




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

