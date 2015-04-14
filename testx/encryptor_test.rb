gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/encryptor'
require './libx/combine_offsets'
require './libx/grouper'

# require './libx/key'
# require './libx/date_key'

class EncryptorTest < Minitest::Test

  def setup
    @rubix = Encryptor.new("try ruby", "41521","020315" )
    # @key = Key.new("41521")
    # @date_key = DateKey.new("020315")
    # @rotation = CombineOffsets.new(@key, @date_key).offsets
    # @divvy = Grouper.new("try ruby")
  end
  def test_there_is_an_encryptor
    rubix = Encryptor.new("try ruby", "41521","020315" )
  end

  def test_it_can_accept_offsets_values
    assert_equal [50,17,54,26], @rubix.rotation_values
  end

  def test_it_can_accept_a_message_to_encrypt
    assert_equal [["t","r","y"," "],["r","u","b","y"]], @rubix.chunked_message
  end

  def test_it_can_encrypt_one_letter
    skip
    assert_equal "x", @rubix.input(@divvy.chunk).encrypt
  end

end
