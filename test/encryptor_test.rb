# gem 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/encryptor'
# #require './lib/grouper'
#
# class EncryptorTest < Minitest::Test
#   def test_there_is_an_encryptor
#     rubix = Encryptor.new({starter: 41521, divvy: "try ruby", day: "020315"})
#     assert rubix
#   end
#
#
#   # def test_it_can_recieve_a_message
#   #   rubix = Encryptor.new
#   #   assert_equal "message", rubix.recieve("message")
#   # end
#
#
#   def test_it_can_recieve_a_sliced_up_message_from_grouper
#     rubix = Encryptor.new({starter: 41521, divvy: "try ruby", day: "020315"})
#     divvy = Grouper.new("try ruby")
#     assert_equal [["t","r","y"," "],["r","u","b","y"]], rubix.recieve(divvy.chunk)
#   end
#
#   # def test_it_can_determine_how_much_to_rotate_first_character
#   #   rubix = Encryptor.new({starter: 41521, divvy: "try ruby", day: "020315"})
#   #   # day = Date.new("020315")
#   #   assert_equal [23,32], rubix.determine_rotation
#   # end
#
#
# end
#
