require_relative "board"
require_relative "cursor"

require "colorize"

require 'byebug'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
    @selected_positions = []
  end

  def render
    p @board[[1,0]].moves
    while true
      display_grid
      result = @cursor.get_input
      @selected_positions << result unless result.nil?
      if @selected_positions.length == 2
        move(@selected_positions)
      end
    end
  end

  def move(positions)
    @board.move_piece(positions.first, positions.last)
    @selected_positions = []
  end

  private
  def display_grid
    system("clear")
    @board.grid.each_with_index do |row, r_idx|
      p_row = []
      row.each_with_index do |col, c_idx|
        if @cursor.cursor_pos == [r_idx, c_idx]
          p_row << col.to_s.colorize(:red)
        elsif @selected_positions.any? { |pos| pos == [r_idx, c_idx] }
          p_row << col.to_s.colorize(:blue)
        else
          p_row << col.to_s
        end
      end
      puts p_row.join(" ")
    end
  end
end
