require './libx/cipher'
require './libx/key'
require './libx/date_key'
require 'byebug'

handle = File.open("#{ARGV[0]}", "r")
# puts "#{ARGV[0]}"
# puts "#{ARGV[1]}"


# handle.Read
message = handle.read.chomp
p message

# make sure it can generate it's own key and date
cipher = Cipher.new("hey hi how are you" )
# assert_equal "48ax2", cipher.encrypt
# cipher= Cipher.new("hey hi how are you here's a message lets encrypt this shit" ,"41521","020315")

encrypted_message = cipher.encrypt
p encrypted_message


writer = File.open("#{ARGV[1]}", "w")
writer.write(encrypted_message)
writer.close


puts "Created #{ARGV[1]} with the key #{cipher.key_in.key} and date #{cipher.date_key_in.date_string}"


# cat reverse shovel input



# ruby ./libx/encrypt_run.rb message.txt encrypted.txt

#
# if File.exists? (filename)
#   puts "#{filename} exists"
# end









# if File.exists?(file_to_write)
#   puts "A file by the name of '#{file_to_write}' already exists. Are you sure you want to overwrite it? Yes/No"
#   input = $stdin.gets.chomp
#   if input == "Yes"
#     encrypted_file = File.open(file_name, "w")
#     encrypted_file.puts encrypted_message
#     encrypted_file.close
#     @printer.puts "Created '#{file_to_write}' with the key #{@key.key} and date #{@date.date}"
#   else
#     abort("Program canceled.")
#   end
# else
#   encrypted_file = File.open(file_name, "w")
#   encrypted_file.puts encrypted_message
#   encrypted_file.close
#   @printer.puts "Created '#{file_to_write}' with the key #{@key.key} and date #{@date.date}"
# end
