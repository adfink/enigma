gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './libx/grouper'

class GrouperTest < Minitest::Test
  def test_there_is_a_grouper
    divvy = Grouper.new
  end

  def test_it_can_accept_a_message
    divvy = Grouper.new("message")
    assert_equal "message", divvy.message
  end

  def test_it_can_return_array_composed_of_first_four_elements_from_message
    divvy = Grouper.new("try ")
    assert_equal [["t","r","y"," "]], divvy.chunk
  end

  def test_it_can_return__two_four_character_arrays_composed_of_elements_from_message
    divvy = Grouper.new("try ruby")
    assert_equal [["t","r","y"," "],["r","u","b","y"]], divvy.chunk
  end


  def test_it_can_group_a_message_into_four_element_parts
    divvy = Grouper.new("Hi, I am a message")
    assert_equal [["H","i",","," "],["I"," ","a","m"],[" ", "a", " ", "m"],["e", "s","s","a"],["g","e"]] , divvy.chunk
  end
end
