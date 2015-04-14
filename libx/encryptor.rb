require './libx/combine_offsets'
require './libx/grouper'
require './libx/key'
require './libx/date_key'
require './libx/combine_offsets'


class Encryptor

  attr_reader :character_map
  attr_reader :chunked_message

  def initialize(message, key, date)
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


  def encrypt

    @rotation_numbers[0]
     index_of_character =  @character_map.index("#{@chunked_message.flatten.pop}")
     index_of_character + @rotation_numbers[0] % 39
     new_character = @character_map[index_of_character + @rotation_numbers[0] % 39]

    return new_character.to_s
  end



end


rubix = Encryptor.new("try ruby", "41521", "020315")
p  rubix.character_map
p rubix.chunked_message
p rubix.rotation_values
