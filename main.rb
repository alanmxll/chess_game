require_relative "./lib/board.rb"
require_relative "./lib/board_renderer_text.rb"
require_relative "./lib/invalid_move_error.rb"
require_relative "./lib/game.rb"
require_relative "./lib/player.rb"
require_relative "./lib/pieces.rb"

# oard = Board.start_chess
board = Board.new
board[[0, 0]] = King.new(board, [0, 0], :black)
board[[6, 6]] = King.new(board, [6, 6], :white)
board[[3, 0]] = Rook.new(board, [3, 0], :white)
board[[3, 1]] = Rook.new(board, [3, 1], :white)

puts board.in_check?(:black)

# puts board.pieces.select { |piece| piece.color == :black }
# game = Game.new(board,
#                 Player.new(:black),
#                 Player.new(:white),
#                 BoardRendererText)
# game.play
