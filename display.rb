require_relative "board"
require_relative "cursor"

require "colorize"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    @board.grid.each do |row|
      puts row.map(&:to_s)
    end
  end
end
