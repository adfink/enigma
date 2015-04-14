# gem 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/date.rb'
#
# class DateTest < Minitest::Test
#
#   def test_there_is_a_date
#     day = Date.new
#   end
#
#   def test_it_can_take_a_date_value
#     day = Date.new("020315")
#     assert_equal "020315", day.encrypt_date
#   end
#
#   def test_it_can_square_the_value_of_the_encrypt_date
#     day = Date.new("020315")
#     assert_equal 412699225, day.encrypt_date_squared
#   end
#
#   def test_it_can_isolate_the_last_four_digits_of_squared_encrypt_date_for_key
#     day = Date.new("020315")
#     assert_equal 9225, day.get_four_key_digits
#   end
#
#   def test_it_can_produce_an_array_of_numbers_from_last_four_digits
#     day = Date.new("020315")
#     assert_equal [9,2,2,5], day.produce_offset
#   end
#
# end
#
# =begin
# date comes in in format DDMMYY, like 020315
# must square this number
# take the last four digits
# =end
#
#
#
#
# # gem 'minitest'
# # require 'minitest/autorun'
# # require 'minitest/pride'
# # require 'Time'
# # require 'date'
# #
# # class DateKeyTest < Minitest::Test
# #   def test_it_takes_in_a_date_string
# #     assert_equal 20315, DateKey.new("020315").date_num
# #   end
# #
# #   def test_it_squares_date_int
# #     assert_equal 412699225, DateKey.new("020315").squared
# #   end
# #
# #
# #   def test_it_can_make_offsets
# #     assert_equal 412699225, DateKey.new("020315").offsets
# #   end
# #
# #   def test_it_uses_today_date_if_none_provided
# #     today =  Time.now.strftime("%m%d%y")
# #     assert_equal today, DateKey.new.date_string
# #
# #   end
# # end
