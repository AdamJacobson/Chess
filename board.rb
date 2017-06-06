require_relative "piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "display"
require_relative "null_piece"

class Board
  attr_reader :grid

  def initialize
    main_row = [Rook.new, Knight.new, Bishop.new, Queen.new,
       King.new, Bishop.new, Knight.new, Rook.new]
    pawns_row = Array.new(8) {Piece.new}
    empty_row = Array.new(8) {NullPiece.new}
    all_pieces = main_row + pawns_row + empty_row + empty_row +
      empty_row + empty_row + pawns_row + main_row.reverse
    @grid = Array.new(8) { Array.new(8) { all_pieces.shift } }
  end

  def move_piece(start_pos, end_pos)
    raise OffBoardError unless in_bounds?(start_pos) || in_bounds?(end_pos)
    raise NullPieceError if self[start_pos].is_a? NullPiece

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def in_bounds?(pos)
    pos.all? { |cord| (0..7).cover? cord }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

end

class OffBoardError < StandardError

end

class NullPieceError < StandardError

end
