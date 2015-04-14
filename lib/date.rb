class Date

  attr_reader :encrypt_date
  attr_reader :key_digits_from_date

  def initialize(encrypt_date = nil)

    @encrypt_date = encrypt_date
  end

  def encrypt_date_squared
    @encrypt_date.reverse.chop.reverse.to_i**2

  end

  def get_four_key_digits
    @key_digits_from_date = encrypt_date_squared.to_s.chars.to_a.last(4).join.to_i
  end
end


 # __FILE__ $$

day = Date.new("020315")
p day.get_four_key_digits
# p day.key_digits_from_date
