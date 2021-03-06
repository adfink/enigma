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
    assert_equal [50,17,54,26], @rubix.rotation_numbers
  end

  def test_it_can_accept_a_message_to_encrypt
    assert_equal [["t","r","y"," "],["r","u","b","y"]], @rubix.sliced_message
  end

  def test_it_can_encrypt_one_letter
    alan = Encryptor.new("t", "41521","020315" )
    assert_equal "4", alan.encrypt
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
    alan = Encryptor.new("try r", "41521","020315" )
    assert_equal "48ax2", alan.encrypt
  end

  def test_it_can_encrypt_eight_characters
    alan = Encryptor.new("try ruby", "41521","020315" )
    assert_equal "48ax2.ql", alan.encrypt
  end

  def test_it_can_encrypt_a_sentence
    alan = Encryptor.new("try rubytry rubytry ruby", "41521","020315" )
    assert_equal "48ax2.ql48ax2.ql48ax2.ql", alan.encrypt
  end

  def test_it_has_a_message_to_decrypt
    @solver = Encryptor.new("48ax2.ql", "41521","020315")
    assert_equal "try ruby", @solver.decrypt
  end

end
