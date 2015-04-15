require './libx/encryptor'
require './libx/key'
require './libx/date_key'

handle = File.open("#{ARGV[0]}", "r")
# puts "#{ARGV[0]}"
# puts "#{ARGV[1]}"


# handle.Read
message = handle.read.chomp
p message

# make sure it can generate it's own key and date
rubix = Encryptor.new(message,"41521","020315")

encrypted_message = rubix.encrypt

# p encrypted_message


writer = File.open("#{ARGV[1]}", "w")
writer.write(encrypted_message)
writer.close


puts "Created #{ARGV[1]} with the key #{rubix.key_in.key} and date #{rubix.date_key_in.date_string}"


# cat reverse shovel input



# ruby ./libx/encrypt_run.rb message.txt encrypted.txt

#
# if File.exists? (filename)
#   puts "#{filename} exists"
# end
