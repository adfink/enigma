require './libx/cipher'

handle = File.open("#{ARGV[0]}", "r")

garbled_message = handle.read.chomp

solver = Cipher.new(garbled_message,"#{ARGV[2]}","#{ARGV[3]}")

decrypted_message = solver.decrypt

writer = File.open("#{ARGV[1]}", "w")
writer.write(decrypted_message)
writer.close

puts "Created #{ARGV[1]} with the key #{solver.key_in.key} and date #{solver.date_key_in.date_string}"


# ruby ./libx/decrypt_run.rb encrypted.txt decrypted.txt




