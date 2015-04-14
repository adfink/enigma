gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date.rb'

class DateTest < Minitest::Test

  def test_there_is_a_date
    day = Date.new
  end

  def test_it_can_take_a_date_value
    day = Date.new("020315")
    assert_equal "020315", day.encrypt_date
  end

  def test_it_can_square_the_value_of_the_encrypt_date
    day = Date.new("020315")
    assert_equal 412699225, day.encrypt_date_squared
  end

  def test_it_can_isolate_the_last_four_digits_of_squared_encrypt_date_for_key
    day = Date.new("020315")
    assert_equal 9225, day.get_four_key_digits
  end

end

=begin
date comes in in format DDMMYY, like 020315
must square this number
take the last four digits
=end
