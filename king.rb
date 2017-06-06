require_relative 'piece'

class King < Piece
  attr_reader :symbol

  def initialize
    @symbol = "\u2654"
    @move_dirs = [:vertical, :diagonal]
  end

  def move_dirs
    @move_dirs
  end
end
