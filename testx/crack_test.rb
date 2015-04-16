gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
# require './libx/decryptor'
# require './libx/combine_offsets'
# require './libx/grouper'
# require './libx/encryptor'
require './libx/crack'

# require './libx/key'
# require './libx/date_key'

class CrackTest < Minitest::Test
  def test_there_is_a_cracker
    turing = Crack.new
  end

end
