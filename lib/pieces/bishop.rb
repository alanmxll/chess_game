class Bishop < Piece
  include Slidable

  def to_s
    color == :black ? "♝" : "♗"
  end

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
    ]
  end
end
