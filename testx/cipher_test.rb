gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/cipher'
require './libx/combine_offsets'
require './libx/grouper'

# require './libx/key'
# require './libx/date_key'

class CipherTest < Minitest::Test

  def setup
    @rubix = Cipher.new("try ruby", "41521","020315" )
    # @key = Key.new("41521")
    # @date_key = DateKey.new("020315")
    # @rotation = CombineOffsets.new(@key, @date_key).offsets
    # @divvy = Grouper.new("try ruby")
  end
  def test_there_is_an_cipher
    rubix = Cipher.new("try ruby", "41521","020315" )
  end

  def test_it_can_accept_offsets_values
    assert_equal [50,17,54,26], @rubix.rotation_numbers
  end

  def test_it_can_accept_a_message_to_encrypt
    assert_equal [["t","r","y"," "],["r","u","b","y"]], @rubix.sliced_message
  end

  def test_it_can_encrypt_one_letter
    cipher = Cipher.new("t", "41521","020315" )
    assert_equal "4", cipher.encrypt
  end

  def test_it_can_encrypt_one_letter
    cipher = Cipher.new("t", "41521","020315" )
    assert_equal "4", cipher.encrypt
  end

  def test_it_can_encrypt_two_letters
    cipher = Cipher.new("tr", "41521","020315" )
    assert_equal "48", cipher.encrypt
  end

  def test_it_can_encrypt_four_letters
    cipher = Cipher.new("try ", "41521","020315" )
    assert_equal "48ax", cipher.encrypt
  end

  def test_it_can_encrypt_five_letters
    cipher = Cipher.new("try r", "41521","020315" )
    assert_equal "48ax2", cipher.encrypt
  end

  def test_it_can_encrypt_eight_characters
    cipher = Cipher.new("try ruby", "41521","020315" )
    assert_equal "48ax2.ql", cipher.encrypt
  end

  def test_it_can_encrypt_a_sentence
    cipher = Cipher.new("try rubytry rubytry ruby", "41521","020315" )
    assert_equal "48ax2.ql48ax2.ql48ax2.ql", cipher.encrypt
  end

  def test_it_has_a_message_to_decrypt
    cipher = Cipher.new("48ax2.ql", "41521","020315")
    assert_equal "try ruby", cipher.decrypt
  end


  def test_it_can_accept_offsets_values
    cipher = Cipher.new("48ax2.ql", "41521","020315")
    assert_equal [50,17,54,26], cipher.rotation_numbers
  end

  def test_it_can_chunk_garbled_message_into_four_character_chunks
    cipher = Cipher.new("48ax2.ql", "41521","020315")
    assert_equal [["4","8","a","x"],["2",".","q","l"]], cipher.sliced_message
  end

end
