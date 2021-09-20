class Rook < Piece
  include Slidable

  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  def to_s
    color == :black ? "♜" : "♖"
  end
end
