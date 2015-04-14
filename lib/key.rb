# class Key
#
#   attr_reader :key
#
#   def initialize(numbers = generate)
#     @key = numbers
#   end
#
#   def generate
#     digits = (0..9).to_a    #rand(9)???
#     @key = ""
#     5.times do
#       @key << digits.sample.to_s
#     end
#     return @key
#   end
#
#   def rotator_values
#
#     key_split = @key.to_s.chars
#     pairs = []
#     first_count = 0                 #each_cons(2) {|a,b| puts #{a}#{b} }.map
#     second_count = 1                #keystring.chars.each_cons(2).map(&:join).map(&:to_i)
#     4.times do
#       pair_number = ""
#       pair_number << key_split[first_count]
#       pair_number << key_split[second_count]
#       pairs << pair_number.to_i
#       first_count += 1
#       second_count += 1
#     end
#
#     return pairs
#
#   end
# end
#
#   # if there is a zero in the key? write a test to handle this edge case
#
#
#
#
# # factory method
# # def self.generate
# # keystring = (0..4).map { rand(9) }.join
# # Key.new(keystring)
# # end
#
#
# starter = Key.new(41521)
# p starter.rotator_values

