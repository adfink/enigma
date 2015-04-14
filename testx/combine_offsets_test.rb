gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/combine_offsets'
require './libx/key'
require './libx/date_key'

class CombineOffsetsTest < Minitest::Test

  def test_it_takes_a_key_and_date_key_and_combines_them_into_an_array_of_rotation_values
    key = Key.new("41521")
    date_key = DateKey.new("020315")
    rotation = CombineOffsets.new(key, date_key).offsets
    assert_equal  [50,17,54,26],rotation
  end

end
