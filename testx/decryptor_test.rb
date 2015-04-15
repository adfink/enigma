gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/decryptor'
require './libx/combine_offsets'
require './libx/grouper'
require './libx/encryptor'

# require './libx/key'
# require './libx/date_key'

class DecryptorTest < Minitest::Test

  # def setup
  #   @rubix = Encryptor.new("try ruby", "41521","020315" )
  #   # @solver = Decryptor.new(@rubix.encrypt)
  #   @solver = Decryptor.new(@rubix.outputs_for_decryptor)
  # end

  def test_it_has_a_message_to_decrypt
    @solver = Decryptor.new("48ax2.ql", "41521","020315")
    assert_equal "48ax2.ql", @solver.input_message
  end

  def test_it_can_accept_offsets_values
    @solver = Decryptor.new("48ax2.ql", "41521","020315")
    assert_equal [50,17,54,26], @solver.rotation_numbers
  end

  def test_it_can_chunk_garbled_message_into_four_character_chunks
    @solver = Decryptor.new("48ax2.ql", "41521","020315")
    assert_equal [["4","8","a","x"],["2",".","q","l"]], @solver.garbled_chunked_message
  end

  def test_it_can_decrypt_eight_characters
    @solver = Decryptor.new("48ax2.ql", "41521","020315")
    assert_equal "try ruby", @solver.decrypt
  end

end
