require_relative "board"
require_relative "cursor"

require "colorize"

require 'byebug'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    while true
      display_grid
      result = @cursor.get_input
      @selected_position = result unless result.nil?
      p @selected_position
    end
  end

  private
  def display_grid
    # system("clear")
    @board.grid.each_with_index do |row, r_idx|
      p_row = []
      row.each_with_index do |col, c_idx|
        if @cursor.cursor_pos == [r_idx, c_idx]
          p_row << col.to_s.colorize(:red)
        elsif [r_idx, c_idx] == @selected_position
          p_row << col.to_s.colorize(:blue)
        else
          p_row << col.to_s
        end
      end
      puts p_row.join(" ")
    end
  end
end
