class Pawn < Piece
  attr_accessor :dx
  def initialize(color,position,board)
    super
    @moved = false
    color == :white ? @dx = 1 : @dx = -1
  end

  def moves
    forward_moves.concat(diagonals)
  end

  def forward_moves
    x, y  = position
    result = [[x + dx, y]]

    result << [x + 2 * dx, y] unless @moved
    result.select { |pos| check_move?(pos) }
  end

  def diagonals
    x, y = position
    diagonal_moves = [[x + dx, y + 1], [x + dx, y - 1]]
    diagonal_moves.select do |move|
      board.occupied?(move) && !same_color?(board[move])
    end
  end

  def check_move?(move)
    board.in_board?(move) && !board.occupied?(move)
  end

  def move(new_position)
    @moved = true
    super
  end

  def render
    color == :white ? "\u2659" : "\u265F"
  end

end
