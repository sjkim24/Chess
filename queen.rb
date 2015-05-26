class Queen < SlidingPiece

  def move_dirs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
      [1,0],
      [0,1],
      [-1,0],
      [0,-1]
    ]
  end

  def render
    color == :white ? "\u2655" : "\u265B"
  end

end
