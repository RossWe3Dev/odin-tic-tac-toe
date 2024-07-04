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
