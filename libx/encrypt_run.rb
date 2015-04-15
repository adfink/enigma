require './libx/encryptor'
require './libx/key'
require './libx/date_key'

handle = File.open("#{ARGV[0]}", "r")
# puts "#{ARGV[0]}"
# puts "#{ARGV[1]}"


# handle.Read
message = handle.read.chomp
p message

rubix = Encryptor.new(message,"41521","020315")

encrypted_message = rubix.encrypt

# p encrypted_message


writer = File.open("#{ARGV[1]}", "w")
writer.write(encrypted_message)
writer.close


puts "Created #{ARGV[1]} with the key #{rubix.key_in.key} and date #{rubix.date_key_in.date_string}"

#
# def run
#   file = File.open(file_to_read, "r")
#   contents = file.read
#   encrypted_message = StringRotator.new(contents, @offset).encrypt
#
#   file_name = file_to_write
#   encrypted_file = File.open(file_name, "w")
#   encrypted_file.puts encrypted_message
#   encrypted_file.close
#
#   @printer.puts "Created '#{file_to_write}' with the key #{@key.key} and date #{@date.date}"
# end

# cat reverse shovel input


# ruby ./libx/encrypt_run.rb message.txt encrypted.txt

