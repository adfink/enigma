require './libx/cipher'
require 'byebug'

class Crack
  attr_accessor :key
  attr_reader :garbled_message, :modified_message, :date
  def initialize(date, message)
    @date             = date
    @key              = '00000'
    @modified_message = ""
    @garbled_message  = message

  end

  def check_key_values
    until confirmed_decrypted?
      cipher = Cipher.new(@garbled_message, @key, @date)
      @modified_message = cipher.decrypt
      @key = (@key.to_i + 1).to_s.rjust(5, "0")
      @character_map    = [*("a".."z"), *("0".."9"), * " ", ".", ","]
      p @character_map.sample * ((@key[0].to_i*15) + (@key[1].to_i*5))
        end
    @key.rjust(5,"0")
  end

    private
    def confirmed_decrypted?
      matching_phrase = "..end.."
      @modified_message[-7..-1] == matching_phrase
    end



end

