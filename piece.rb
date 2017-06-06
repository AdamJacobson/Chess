class Piece
  def initialize
    @symbol = "P"
  end

  def to_s
    @symbol.encode('utf-8')
  end

  def moves
    #returns array of pieces the piece can move to
  end
end
