require_relative "board"
require_relative "cursor"

require "colorize"

require 'byebug'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    system("clear")
    @board.grid.each do |row|
      puts row.map(&:to_s).join(" ")
    end
    nil
  end
end
