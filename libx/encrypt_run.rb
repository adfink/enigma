require './libx/encryptor'

handle = File.open("./libx/#{ARGV[0]}", "r")
# puts "#{ARGV[0]}"
# puts "#{ARGV[1]}"


# handle.Read
message = handle.read
p message

rubix = Encryptor.new("try ruby","41521","020315")

encrypted_message = rubix.encrypt

# p encrypted_message


writer = File.open("#{ARGV[1]}", "w")
writer.write(encrypted_message)
writer.close

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
