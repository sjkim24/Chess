require_relative 'load_file.rb'
require "Colorize"
class Game
  INVALID_MOVE_ERROR = "NO VALID MOVES AT THAT SPOT".colorize(:red)

  CONVERTER = {
    0 => "A",
    1 => "B",
    2 => "C",
    3 => "D",
    4 => "E",
    5 => "F",
    6 => "G",
    7 => "H"
  }

  attr_accessor  :player1, :player2, :current_player, :board

  def self.new_game
    player1 = HumanPlayer.new(ask_name)
    player2 = HumanPlayer.new(ask_name)
    Game.new(player1, player2).play
  end

  def self.ask_name
    puts "Please enter your name"
    gets.chomp.capitalize
  end

  def self.testing
    sj = HumanPlayer.new("sj")
    thomas  = HumanPlayer.new("thomas")
    Game.new(sj, thomas).play
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    set_colors
    set_board
  end

  def set_colors
    player1.set_color(:white)
    player2.set_color(:black)
  end

  def set_board
    @board = Board.default_game_board
  end

  def play
    loop do
      break if game_over?
      play_turn
      self.current_player = next_player
    end

    winner
  end

  def play_turn
    begin
      display_board
      puts "CHECK!" if board.in_check?(current_player.color)
      move = get_move
      board.move(move[0],move[1], current_player.color)
    rescue
      p $!
       # p $!, *$@
      retry
    end
  end

  def get_move
    start_pos = current_player.get_start
    if converted_moves(board[start_pos]).empty?
      raise InvalidInputError.new INVALID_MOVE_ERROR
    end
    p converted_moves(board[start_pos])
    end_pos = current_player.get_end

    [start_pos, end_pos]
  end

  def converted_moves(piece)
    piece.valid_moves.map do |row,col|
      CONVERTER[col] + (row + 1).to_s
    end
  end

  def next_player
    current_player == player1 ? player2 : player1
  end

  def game_over?
    board.no_valid_moves_left?(current_player.color)
  end

  def display_board
    puts board.display
    puts "#{current_player.name}, it's your turn"
  end

  def winner
    if board.checkmate?(current_player.color)
      puts "CHECKMATE! #{next_player.name} WINS!"
    else
      puts "IT'S A DRAW!"
    end
  end

end
