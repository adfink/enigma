require './libx/combine_offsets'
require './libx/message_slicer'
# require './libx/key'
# require './libx/date_key'
require 'byebug'


class Cipher
  attr_reader :sliced_message, :encrypted_string, :rotation_numbers, :key_in, :date_key_in

  def initialize(message, key, date)
    @sliced_message   = MessageSlicer.new(message).chunk
    @key_in           = Key.new(key)
    @date_key_in      = DateKey.new(date)
    @rotation_numbers = CombineOffsets.new(@key_in, @date_key_in).offsets
    @character_map    = [*("a".."z"), *("0".."9"), * " ", ".", ","]
  end


  def encrypt
    @sliced_message.map do |slice|
      index_values_of_current_slice_in_character_map(slice).map.with_index do |charmap_position, index|
        (@rotation_numbers[index] + charmap_position) % 39
      end.map {|i| @character_map[i]}
    end.join
  end

  def decrypt
    @sliced_message.map do |slice|
      # byebug
      index_values_of_current_slice_in_character_map(slice).map.with_index do |charmap_position, index|
        charmap_position - (@rotation_numbers[index] % 39)
      end.map {|i| @character_map[i]}
    end.join
  end

  def index_values_of_current_slice_in_character_map(current_slice)
    current_slice.map.with_index { | letter, index |  @character_map.index(current_slice[index])}
  end

  def crack

  end

end
