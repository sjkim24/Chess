class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color,position,board)
    @color = color
    @position = position
    @board = board
    board[position] = self
  end

  def moves
    raise NotImplementedError.new "Why are you here?"
  end

  def same_color?(other_piece)
    color == other_piece.color
  end

  def move(new_position)
    self.position = new_position
  end

  def dup(dup_board)
    self.class.new(@color, @position, dup_board)
  end

  def move_into_check?(move_position)
    dup_board = board.dup

    dup_board.move!(@position, move_position)
    dup_board.in_check?(@color)
  end

  def valid_moves
    moves.select { |move| !move_into_check?(move) }
  end

  def inspect
    [color, position].inspect
  end

end
