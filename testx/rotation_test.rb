gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/rotation'
require './libx/key'
require './libx/date_key'

class RotationTest < Minitest::Test

  def test_it_takes_a_key_and_date_key
    key = Key.new("41521")
    date_key = DateKey.new("020315")
    rotation = Rotation.new(key, date_key).offsets
    assert_equal  [50,17,54,26],rotation

  end

end
