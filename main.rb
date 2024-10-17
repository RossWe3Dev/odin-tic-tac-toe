require "colorize"

require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

def play_game
  puts "~ Let's play tic-tac-toe! ~".upcase.colorize(:cyan)
  game = Game.new
  game.play
  play_again?
end

def play_again?
  puts "Press 'y' to play again :) [y/quit]".colorize(:cyan)
  if gets.chomp.downcase == "y"
    play_game
  else
    puts "Thanks for playing!".colorize(:cyan)
  end
end

play_game
