require "colorize"

require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

def play_game
  puts "~ Let's play tic-tac-toe! ~".upcase.colorize(:cyan)
  game = Game.new
  game.play
  puts "Press 'y' to play again :) [y/quit]".colorize(:cyan)
  play_game while gets.chomp.downcase == "y"
  puts "Thanks for playing!".colorize(:cyan)
end

play_game
