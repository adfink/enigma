require './libx/cipher'

handle = File.open("#{ARGV[0]}", "r")

message = handle.read.chomp

cipher = Cipher.new(message)

encrypted_message = cipher.encrypt

writer = File.open("#{ARGV[1]}", "w")
writer.write(encrypted_message)
writer.close

puts "Created #{ARGV[1]} with the key #{cipher.key_in.key} and date #{cipher.date_key_in.date_string}"





# ruby ./libx/encrypt_run.rb message.txt encrypted.txt


