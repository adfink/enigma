class Date

  attr_reader :encrypt_date
  attr_reader :offset

  def initialize(encrypt_date = nil)

    @encrypt_date = encrypt_date
  end

  def encrypt_date_squared
    @encrypt_date.reverse.chop.reverse.to_i**2

  end

  def get_four_key_digits
    encrypt_date_squared.to_s.chars.to_a.last(4).join.to_i
  end

  def produce_offset
    @offset = get_four_key_digits.to_s.chars.map! do |element|
      element.to_i
    end
    return @offset

  end


end


# # #  # __FILE__ $$
# # #
# # day = Date.new("020315")
# # p day.get_four_key_digits
# # p day.offset
# #
# #
# class DateKey
#   attr_reader :date_string
#   def initialize(date_string = today)
#     @date_string = date_string
#   end
#
#   def date_num
#     date_string.to_i
#   end
#
#   def squared
#     date_num**2
#   end
#
#   def offsets
#     squared.to_s.chars.last(4).map(&to_i)
#   end
#
#   def today
#     Time.now.strftime("%m%d%y")
#   end
# end
#
# Time.now.strftime("%m%d%y")
