module Slideable
  def moves
    valid_moves = []
    if move_dirs.include?(:vertical)
      x_pos = @pos.first
      y_pos = @pos.last


      # right
      idx = 1
      while @board[[x_pos + idx, y_pos]].is_a?(NullPiece) && @board.in_bounds?([x_pos + idx, y_pos])
        valid_moves << [x_pos + idx, y_pos]
        idx += 1
      end

      # left
      idx = -1
      while @board[[x_pos + idx, y_pos]].is_a?(NullPiece) && @board.in_bounds?([x_pos + idx, y_pos])
        valid_moves << [x_pos + idx, y_pos]
        idx -= 1
      end

      # up
      idx = -1
      while @board[[x_pos, y_pos + idx]].is_a?(NullPiece) && @board.in_bounds?([x_pos, y_pos + idx])
        valid_moves << [x_pos + idx, y_pos]
        idx -= 1
      end

      # down
      idx = 1
      while @board[[x_pos, y_pos + idx]].is_a?(NullPiece) && @board.in_bounds?([x_pos, y_pos + idx])
        valid_moves << [x_pos + idx, y_pos]
        idx += 1
      end
    end
    valid_moves
  end
end
