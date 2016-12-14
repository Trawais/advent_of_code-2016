class BathroomSecurity
  KEY_PAD = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

  def initialize()
    @current = {row: 1, col: 1}
    @result = []
  end

  def get_current_number
    KEY_PAD[@current[:row]][@current[:col]]
  end

  def move_up
    @current[:row] = [@current[:row] - 1, 0].max
  end

  def move_down
    @current[:row] = [@current[:row] + 1, 2].min
  end

  def move_left
    @current[:col] = [@current[:col] - 1, 0].max
  end

  def move_right
    @current[:col] = [@current[:col] + 1, 2].min
  end

  def get_code
    @result.join
  end

  def execute_move(direction)
    case direction
    when 'U'
      move_up
    when 'D'
      move_down
    when 'L'
      move_left
    when 'R'
      move_right
    end
  end

  def execute_instructions(instructions)
    instructions.each_line do |line|
      line.each_char { |chr| execute_move(chr) }
      @result << get_current_number
    end
  end
end
