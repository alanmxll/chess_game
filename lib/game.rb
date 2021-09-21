class Game
  attr_reader :board, :player_one, :player_two, :renderer
  attr_accessor :current_player

  def initialize(board, player_one, player_two, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
  end

  def swap_player!
    self.current_player = (current_player == player_one ? player_two : player_one)
  end

  def play
    while !over?
      puts `clear`
      renderer.render
      puts "It's #{current_player.color}`s turn"
      take_turn
      swap_player!
    end
  end

  def over?
    false
  end

  def take_turn
    start_pos = nil

    loop do
      puts "Select a piece to move: "
      start_pos = current_player.get_pos
      if !board[start_pos].nil? && board[start_pos].color == current_player.color
        break
      end
      puts "Did not select a #{current_player.color} piece."
    end

    loop do
      puts "Select a position to move to: "
      end_pos = current_player.get_pos

      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => error
        puts error.message
      end
    end
  end
end
