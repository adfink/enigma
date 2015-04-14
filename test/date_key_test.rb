gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'Time'
require 'date'

class DateKeyTest < Minitest::Test
  def test_it_takes_in_a_date_string
    assert_equal 20315, DateKey.new("020315").date_num
  end

  def test_it_squares_date_int
    assert_equal 412699225, DateKey.new("020315").squared
  end


  def test_it_can_make_offsets
    assert_equal 412699225, DateKey.new("020315").offsets
  end

  def test_it_uses_today_date_if_none_provided
    today =  Time.now.strftime("%m%d%y")
    assert_equal today, DateKey.new.date_string

  end
end
