require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable
  attr_reader :symbol

  def initialize
    @symbol = "\u2656"
    @move_dirs = [:vertical]
  end

  def move_dirs
    @move_dirs
  end
end
