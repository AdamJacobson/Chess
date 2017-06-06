require_relative 'piece'

class Bishop < Piece
  attr_reader :symbol

  def initialize
    @symbol = "\u2657"
    @move_dirs = [:diagonal]
  end

  def move_dirs
    @move_dirs
  end
end
