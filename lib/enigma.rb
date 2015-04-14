# require 'encryptor'
# require 'grouper'
# require 'key'
# require 'date'
#
# class Enigma
#
#   def initialize
#     @rubix = Encryptor.new({starter: 41521, divvy: "try ruby", day: "020315"})
#   end
#
#
#
#
#
# end
#



#   def initialize (title)
#     @title = title
#     @players = []
#   end
#
#   def add_player (a_player)
#     @players << a_player
#   end
#
#   #could also write this code to serve the same purpose
#   #@players.push(a_player)
#
#   attr_reader :title
#
#   def play (rounds)
#
#
#
#     puts "There are #{@players.size} players in #{@title}:"
#     @players.each do |player|
#       puts player
#     end
#
#     treasures = TreasureTrove::TREASURES
#     puts "\n There are #{treasures.size} treasures to be found:"
#     treasures.each do |treasure|
#       puts "A #{treasure.name} is worth #{treasure.points} points"
#     end
#
#
#
#
#     1.upto(rounds) do |round|
#       puts "\nRound #{round}:"
#
#       @players.each do |player|
#
#         GameTurn.take_turn(player)
#         puts player
#
#       end
#     end
#
#     def print_name_and_health(player)
#       puts "#{player.name} (#{player.health})"
#
#     end
#
#     def print_stats
#       strong_players = @players.select { |player| player.strong?}
#       wimpy_players = @players.reject {|player| player.strong?}
#       # or   strong_players, wimpy_players = @players.partition { |player| player.strong? }
#
#       puts "\n#{@title} Statistics:"
#       puts "\n#{strong_players.size} strong players:"
#       strong_players.each do |player|
#         print_name_and_health(player)
#       end
#
#       puts "\n#{wimpy_players.size} wimpy players:"
#       wimpy_players.each do |player|
#         print_name_and_health(player)
#       end
#
#
#       sorted_players = @players.sort {|a,b| b.score<=>a.score}
#
#       puts "\n#{@title} High Scores:"
#       @players.sort.each do |player|
#         formatted_name = player.name.ljust(20, '.')
#         puts "#{formatted_name} #{player.score}"
#       end
#
#       @players.each do |player|
#         puts "\n#{player.name}'s point totals:"
#         puts "#{player.points} grand total points"
#       end
#
#       puts "\n#{total_points} total points from treasures found\n"
#
#     end
#
#
#     def total_points
#       @players.reduce(0) { |sum, player| sum + player.points }
#     end
#
#
#
#
#
#   end
#
#
#
# end
#
#
#

















# class Enigma
#
# end
#
# class Key
#
# end
#
#
# class Encryptor
#
#
# end
#
#
# class Decryptor
#
# end
#
# class Cracker
#
# end
#
#
# class Rotator
#
# end
#
# class EnigmaDate
#
# end
#
#
# # three or five methods per class
