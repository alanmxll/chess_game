require_relative "./lib/board.rb"
require_relative "./lib/board_renderer_text.rb"
require_relative "./lib/invalid_move_error.rb"
require_relative "./lib/game.rb"
require_relative "./lib/player.rb"
require_relative "./lib/pieces.rb"

board = Board.start_chess
game = Game.new(board,
                Player.new(:black),
                Player.new(:white),
                BoardRendererText)
game.play
