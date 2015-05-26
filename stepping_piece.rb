class SteppingPiece < Piece

  def moves
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      new_position = [x + dx, y + dy]
      result << new_position if check_space(new_position)
    end

    result
  end

  def move_dirs
    raise NotImplementedError.new
  end

  def check_space(pos)
    board.in_board?(pos) &&
      (!board.occupied?(pos) || !same_color?(board[pos]))
  end

end
