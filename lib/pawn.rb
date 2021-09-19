class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end

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
