require_relative 'board'
require_relative 'display'

class Game
  attr_reader :board
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @display.render
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
end
