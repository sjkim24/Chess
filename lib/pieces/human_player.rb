
class HumanPlayer

  attr_accessor :color, :name, :board

  MOVE_HASH = {
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
    "H" => 7
  }
  START_PROMPT = "Please enter the position of the piece you would like to move"
  END_PROMPT = "Please enter the position you would like to move that piece to"

  def initialize(name)
    @name = name
  end

  def set_color(color)
    self.color = color
  end

  def ask_move(prompt)
    puts prompt
    gets.chomp.upcase.split("")
  end

  def get_start
    convert_position(ask_move(START_PROMPT))
  end

  def get_end
    convert_position(ask_move(END_PROMPT))
  end

  def convert_position(position)
    col = MOVE_HASH[position[0]]
    row = position[1].to_i - 1
    [row, col]
  end

  def inspect
    [name, color].inspect
  end

end
