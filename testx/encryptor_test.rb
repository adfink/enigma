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
    alan = Encryptor.new("t", "41521","020315" )
    assert_equal "4", alan.encrypt
  end

  def test_it_can_encrypt_two_letters
    alan = Encryptor.new("tr", "41521","020315" )
    assert_equal "48", alan.encrypt
  end

  def test_it_can_encrypt_four_letters
    alan = Encryptor.new("try ", "41521","020315" )
    assert_equal "48ax", alan.encrypt
  end

  def test_it_can_encrypt_five_letters
    skip
    alan = Encryptor.new("try r", "41521","020315" )
    assert_equal "48axf", alan.encrypt
  end

end
