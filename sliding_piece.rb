class SlidingPiece < Piece

  def moves
    result = []

    move_dirs.each do |(dx, dy)|
      temp_moves = moves_in_dirs(dx,dy)
      next if temp_moves.empty?
      temp_moves.pop if is_ally?(temp_moves.last)
      result.concat(temp_moves)
    end

    result
  end

  def is_ally?(move)
    board.occupied?(move) && same_color?(board[move])
  end


  def move_dirs
    raise NotImplementedError.new
  end

  def moves_in_dirs(dx,dy)
    x, y = position
    temp_moves = []
    1.upto(7) do |multiplier|
      new_position = [x + dx * multiplier, y + dy * multiplier]
      return temp_moves unless board.in_board?(new_position)
      temp_moves << new_position
      return temp_moves if board.occupied?(new_position)
    end

    temp_moves
  end

end
