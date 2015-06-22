class King < SteppingPiece

  def move_dirs
    [[1,1],
    [1,0],
    [1,-1],
    [0,1],
    [0,-1],
    [-1,1],
    [-1,0],
    [-1,-1]]
  end

  def render
    color == :white ? "\u2654" : "\u265A"
  end

end
