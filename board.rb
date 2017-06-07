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
    main_row_black = [Rook.new, Knight.new, Bishop.new, Queen.new,
      King.new, Bishop.new, Knight.new, Rook.new]
    pawns_row_black = Array.new(8) { Piece.new }
    empty_row_1 = Array.new(8) { NullPiece.new }
    empty_row_2 = Array.new(8) { NullPiece.new }
    empty_row_3 = Array.new(8) { NullPiece.new }
    empty_row_4 = Array.new(8) { NullPiece.new }
    pawns_row_white = Array.new(8) { Piece.new }
    main_row_white = [Rook.new, Knight.new, Bishop.new, King.new, Queen.new,
      Bishop.new, Knight.new, Rook.new]

    all_pieces = main_row_black + pawns_row_black + empty_row_1 + empty_row_2 +
      empty_row_3 + empty_row_4 + pawns_row_white + main_row_white
    @grid = Array.new(8) { Array.new(8) { all_pieces.shift } }

    # Set starting positions and board references
    @grid.each_with_index do |row, r_idx|
      row.each_with_index do |col, c_idx|
        self[[r_idx, c_idx]].pos = [r_idx, c_idx]
        self[[r_idx, c_idx]].board = self
      end
    end

    # p @grid
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
