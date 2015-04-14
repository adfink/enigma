gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/encryptor'
require './libx/combine_offsets'
# require './libx/key'
# require './libx/date_key'

class EncryptorTest < Minitest::Test
  # def test_there_is_an_encryptor
  #   rubix = Encryptor.new
  # end

  def test_it_can_accept_offsets_values
    rubix = Encryptor.new
    key = Key.new("41521")
    date_key = DateKey.new("020315")
    rotation = CombineOffsets.new(key, date_key).offsets

    assert_equal [50,17,54,26], rubix.rotation_values(rotation)
  end

end
