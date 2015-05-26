class Bishop < SlidingPiece


  def move_dirs
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ]
  end

  def render
    color == :white ? "\u2657" : "\u265D"
  end

end
