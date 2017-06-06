require_relative 'piece'

class Knight < Piece
  attr_reader :symbol

  def initialize
    @symbol = "\u2658"
    @move_dirs = [:vertical, :diagonal]
  end

  def move_dirs
    @move_dirs
  end
end
