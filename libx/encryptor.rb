require './libx/combine_offsets'
require './libx/grouper'
# require './libx/key'
# require './libx/date_key'
# require './libx/combine_offsets'


class Encryptor

  # attr_reader :character_map
  attr_reader :chunked_message, :encrypted_string, :rotation_numbers, :key_in, :date_key_in

  def initialize(message, key, date)
    @input_message = message
    @divvy = Grouper.new(message)
    @chunked_message = @divvy.chunk
    @key_in = Key.new(key)
    @date_key_in = DateKey.new(date)
    @rotation_numbers = CombineOffsets.new(@key_in, @date_key_in).offsets
    @character_map = ("a".."z").to_a + ["0", "1", "2","3", "4", "5","6", "7", "8","9"] + [" ", ".", ","]
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


# rubix = Encryptor.new("hello world.", "58241", "041515")
# p rubix.encrypt

# p rubix.file_to_read
# p rubix.file_to_write


# Hello world. This is a sentence, that has been encrypted.
# output = "sv0.zo.b22syi w83oxfirmfp484yttzi w04ow03oq4p4m4yt6l0 t3j"

# def run
#   file = File.open(file_to_read, "r")
#   contents = file.read
#   encrypted_message = StringRotator.new(contents, @offset).encrypt
#
#   file_name = file_to_write
#   encrypted_file = File.open(file_name, "w")
#   encrypted_file.puts encrypted_message
#   encrypted_file.close
#
#   @printer.puts "Created '#{file_to_write}' with the key #{@key.key} and date #{@date.date}"
# end
#
# def file_to_read
#   ARGV[0]
# end
#
# def file_to_write
#   ARGV[1]
# end
