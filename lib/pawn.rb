class Pawn < Piece
  include Stepable

  def move_dirs
    [[0, 1]]
  end

  def to_s
    color == :black ? "♟" : "♙"
  end

  def starting_pos?
    row == 1 || row == 7
  end
end
