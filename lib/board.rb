require_relative "./knight"

# Board is for all changes that happen to the game board. In this case, if a knight
# needs to change position, or we need to map out the edges,etc...
class Board
  attr_accessor :board

  def initialize
    self.board = Array.new(8) { Array.new(8) }
  end

  def board_border
  end

  def place_knight(row, col)
    board[row][col] = Knight.new
  end

  # start/end are both coordinates. (0,0), (2,1).
  # knight would take the start pos as the position where to place the knight. Knight.new(0,0)
  # array[0] would add/sub with each of the KNIGHT_MOVES. << part of posible moves function TODO
  # array[1] does same
  def knight_moves(start_pos, end_pos)
  end
end
