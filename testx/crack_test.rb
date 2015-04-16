gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
# require './libx/decryptor'
# require './libx/combine_offsets'
# require './libx/grouper'
# require './libx/encryptor'
require './libx/crack'

# require './libx/key'
# require './libx/date_key'

class CrackTest < Minitest::Test
  def test_there_is_a_cracker
    crack = Crack.new("020315","try rubytry rubytry ruby" )
  end

  def test_it_can_encrypt_a_sentence
    cipher = Cipher.new("try rubytry rubytry ruby", "41521","020315" )
    assert_equal "48ax2.ql48ax2.ql48ax2.ql", cipher.encrypt
  end

end
