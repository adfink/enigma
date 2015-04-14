gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key.rb'

class KeyTest < Minitest::Test
  def test_there_is_a_key
    numbers = Key.new
  end

  def test_it_can_generate_a_random_five_digit_number
    empty_key = Key.new
    digits = empty_key.generate
    assert_equal 5, digits.length
  end

  def test_it_can_accept_a_provided_key
    starter = Key.new(41521)
    assert_equal 41521, starter.key
  end

  def test_it_can_split_key_into_array_of_four_values
    starter = Key.new(41521)
    assert_equal [41,15,52,21] , starter.rotator_values
  end

end
