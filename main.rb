require "colorize"

class Board
  attr_accessor :array

  def initialize
    @array = Array.new(9, " ")
  end

  def display_board
    row1 = " #{@array[0]} | #{@array[1]} | #{@array[2]} "
    row2 = " #{@array[3]} | #{@array[4]} | #{@array[5]} "
    row3 = " #{@array[6]} | #{@array[7]} | #{@array[8]} "
    row_separator = "---+---+---"
    puts row1
    puts row_separator
    puts row2
    puts row_separator
    puts row3
  end

  def set_marker_position(index, marker)
    @array[index] = marker
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    p "Player #{name} is #{@marker}"
  end
end

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
    puts "Player #{player.name}, where do you want to put your marker? [Please enter a number between 1 and 9]"
    position = gets.chomp.to_i
    board.set_marker_position(position - 1, player.marker)
    board.display_board
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
