require './libx/crack'

handle = File.open("#{ARGV[0]}", "r")
garbled_message = handle.read.chomp

mr_sir_alan_turing = Crack.new("#{ARGV[2]}", garbled_message)
mr_sir_alan_turing.check_key_values
secret_revealed = mr_sir_alan_turing.modified_message
p secret_revealed

writer = File.open("#{ARGV[1]}", "w")
writer.write(secret_revealed)
writer.close

puts "Created #{ARGV[1]} with the key #{mr_sir_alan_turing.key} and date #{mr_sir_alan_turing.date}"


# ruby ./libx/crack_run.rb encrypted.txt cracked.txt 041515
# Created 'cracked.txt' with the cracked key 82648 and date 030415
