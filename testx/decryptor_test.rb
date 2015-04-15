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

  def setup
    @rubix = Encryptor.new("try ruby", "41521","020315" )
    # @solver = Decryptor.new(@rubix.encrypt)
    @solver = Decryptor.new(@rubix.outputs_for_decryptor)
  end

  def test_it_has_a_message_to_decrypt
    assert_equal "48ax2.ql", @solver.garbled_message
  end

  def test_it_can_accept_offsets_values
    assert_equal [50,17,54,26], @solver.rotator_values
  end

  def test_it_can_chunk_garbled_message_into_four_character_chunks
    assert_equal [["4","8","a","x"],["2",".","q","l"]], @solver.chunk
  end

  def test_it_can_decrypt_eight_characters
    assert_equal "try ruby", @solver.decrypt
  end

end
