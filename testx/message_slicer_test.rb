gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/message_slicer'

class MessageSlicerTest < Minitest::Test

  def test_it_can_accept_a_message
    sliced_message = MessageSlicer.new("message")
    assert_equal "message", sliced_message.message
  end

  def test_it_can_return_array_composed_of_first_four_elements_from_message
    sliced_message = MessageSlicer.new("try ")
    assert_equal [["t","r","y"," "]], sliced_message.chunk
  end

  def test_it_can_return__two_four_character_arrays_composed_of_elements_from_message
    sliced_message = MessageSlicer.new("try ruby")
    assert_equal [["t","r","y"," "],["r","u","b","y"]], sliced_message.chunk
  end


  def test_it_can_group_a_message_into_four_element_parts
    sliced_message = MessageSlicer.new("hi, i am a message")
    assert_equal [["h","i",","," "],["i"," ","a","m"],[" ", "a", " ", "m"],["e", "s","s","a"],["g","e"]] , sliced_message.chunk
  end
end
