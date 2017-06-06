require_relative 'piece'

class Queen < Piece
  attr_reader :symbol

  def initialize
    @symbol = "\u2655"
    @move_dirs = [:diagonal, :vertical]
  end

  def move_dirs
    @move_dirs
  end
end
