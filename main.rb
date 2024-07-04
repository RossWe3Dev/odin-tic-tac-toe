require "colorize"

require_relative "lib/board"
require_relative "lib/player"

class Game
  attr_accessor :player_a, :player_b, :board

  def initialize
    @board = Board.new
    @player_a = Player.new("A", "X".colorize(:red))
    @player_b = Player.new("B", "O".colorize(:blue))
  end

  def play
    board.display_board
    game_loop
  end

  def turn(player)
    position = valid_input(player)
    board.set_marker_position(position - 1, player.marker)
    board.display_board
  end

  def valid_input(player)
    loop do
      puts "Player #{player.name}, where do you want to put your marker?" \
           "\n[Please enter a number between 1 and 9]".colorize(:green)
      position = gets.chomp.to_i
      return position if (1..9).include?(position) && board.array[position - 1] == " "

      puts "Invalid input. \nPlease enter a number between 1 and 9 that is not already occupied.".colorize(:magenta)
    end
  end

  def game_loop
    (1..9).each do |i|
      if i.even?
        turn(player_b)
      else
        turn(player_a)
      end
    end
  end
end

puts "Let's play!"
game1 = Game.new
game1.play
