class Piece
  attr_accessor :board, :pos

  def initialize
    @symbol = "P"
  end

  def to_s
    @symbol.encode('utf-8')
  end

end
