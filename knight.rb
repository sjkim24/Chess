class Knight < SteppingPiece

  def move_dirs
    [[1,2],
    [1,-2],
    [-1,2],
    [-1,-2],
    [2,1],
    [2,-1],
    [-2,1],
    [-2,-1]]
  end

  def render
    color == :white ? "\u2658" : "\u265E"
  end

end
