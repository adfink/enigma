# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
# Created 'decrypted.txt' with the key 82648 and date 030415

require './libx/cipher'
require './libx/key'
require './libx/date_key'

handle = File.open("#{ARGV[0]}", "r")
# puts "#{ARGV[0]}"
# puts "#{ARGV[1]}"
garbled_message = handle.read.chomp
p garbled_message

# make sure it can use it's own key, or actually take it from command line instead of hard coded here
solver = Cipher.new(garbled_message,"41521","020315")

decrypted_message = solver.decrypt



p decrypted_message


writer = File.open("#{ARGV[1]}", "w")
writer.write(decrypted_message)
writer.close


puts "Created #{ARGV[1]} with the key #{solver.key_in.key} and date #{solver.date_key_in.date_string}"


# ruby ./libx/decrypt_run.rb encrypted.txt decrypted.txt

# if File.exists? (filename)
# #   puts "#{filename} exists"
# # end



