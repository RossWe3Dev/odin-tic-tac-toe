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

  def set_mark_position(index, mark)
    @array[index] = mark
  end
end

class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
    p "Player #{name} is #{@mark}"
  end
end

class Game
  attr_accessor :player_a, :player_b, :board

  def initialize
    @board = Board.new
    @player_a = Player.new("A", "X")
    @player_b = Player.new("B", "O")
  end

  def play
    board.display_board
    game_loop
  end

  def turn(player)
    puts "Player #{player.name}, where do you want to put your mark? [Please enter a number between 1 and 9]"
    position = gets.chomp.to_i
    board.set_mark_position(position - 1, player.mark)
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
