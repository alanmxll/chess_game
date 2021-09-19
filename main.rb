require_relative "./lib/board.rb"
require_relative "./lib/board_renderer_text.rb"

board = Board.start_chess

text_board = BoardRendererText.new(board)
puts text_board.render
