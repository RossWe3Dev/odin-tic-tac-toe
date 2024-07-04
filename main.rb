require "colorize"

require_relative "lib/board"
require_relative "lib/player"

class Game
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_accessor :player_a, :player_b, :board, :current_player

  def initialize
    @board = Board.new
    @player_a = Player.new("A", "X".colorize(:red))
    @player_b = Player.new("B", "O".colorize(:blue))
    @current_player = nil
  end

  def play
    board.display_board
    game_loop
    display_winner
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
    @current_player = player_a
    until board.full?
      turn(@current_player)
      break if game_over?(current_player)

      @current_player = switch_current_player
    end
  end

  def switch_current_player
    current_player == player_a ? player_b : player_a
  end

  def game_over?(player)
    WINNING_COMBINATIONS.any? do |comb|
      comb.all? { |position| @board.array[position] == player.marker }
    end
  end

  def display_winner
    puts "Player #{@current_player.name} has won!".colorize(:yellow) if game_over?(current_player)
    return unless board.full?

    if game_over?(current_player) == true
      (puts "Player #{@current_player.name} has won!".colorize(:yellow))
    else
      (puts "It's a tie!".colorize(:yellow))
    end
  end
end

puts "Let's play!"
game1 = Game.new
game1.play
