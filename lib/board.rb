class Board
  attr_reader :grid

  def self.start_chess
    board = self.new

    8.times do |c|
      board[[1, c]] = Pawn.new(board, [1, c], :black)
      board[[6, c]] = Pawn.new(board, [6, c], :white)
    end

    [[0, :black], [7, :white]].each do |(row, color)|
      board[[row, 0]] = Rook.new(board, [row, 0], color)
      board[[row, 7]] = Rook.new(board, [row, 7], color)
      board[[row, 1]] = Knight.new(board, [row, 1], color)
      board[[row, 6]] = Knight.new(board, [row, 6], color)
      board[[row, 2]] = Bishop.new(board, [row, 2], color)
      board[[row, 5]] = Bishop.new(board, [row, 5], color)
    end
    board[[0, 3]] = King.new(board, [0, 3], :black)
    board[[7, 3]] = King.new(board, [0, 3], :white)
    board[[0, 4]] = Queen.new(board, [0, 4], :black)
    board[[7, 4]] = Queen.new(board, [0, 4], :white)

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location

    row < grid.length && column < grid.first.length && row >= 0 && column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column].nil?
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if !piece.avaliable_moves.include?(end_pos)
      raise "End position (#{end_pos}) not in avaliable moves: #{piece.avaliable_moves}"
    end
    if !in_bounds?(end_pos)
      raise "End position not in bounds"
    end

    self[start_pos] = nil
    self[end_pos] = piece
    piece.location = end_pos
  end
end
