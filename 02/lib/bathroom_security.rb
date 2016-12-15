class BathroomSecurity
  KEY_PAD = [
    ['#', '#', '#', '#', '#'],
    ['#', '1', '2', '3', '#'],
    ['#', '4', '5', '6', '#'],
    ['#', '7', '8', '9', '#'],
    ['#', '#', '#', '#', '#']
  ]

  ACTUAL_KEY_PAD = [
    ['#', '#', '#', '#', '#', '#', '#'],
    ['#', '#', '#', '1', '#', '#', '#'],
    ['#', '#', '2', '3', '4', '#', '#'],
    ['#', '5', '6', '7', '8', '9', '#'],
    ['#', '#', 'A', 'B', 'C', '#', '#'],
    ['#', '#', '#', 'D', '#', '#', '#'],
    ['#', '#', '#', '#', '#', '#', '#']
  ]

  def initialize(row, col, second_part = false)
    @current = {row: row, col: col}
    @result = []
    @second_part = second_part
  end

  def get_current_number(row: @current[:row], col: @current[:col])
    if @second_part
      ACTUAL_KEY_PAD[row][col]
    else
      KEY_PAD[row][col]
    end
  end

  def move_up
    new_row = @current[:row] - 1
    @current[:row] = new_row unless get_current_number(row: new_row) == '#'
  end

  def move_down
    new_row = @current[:row] + 1
    @current[:row] = new_row unless get_current_number(row: new_row) == '#'
  end

  def move_left
    new_col = @current[:col] - 1
    @current[:col] = new_col unless get_current_number(col: new_col) == '#'
  end

  def move_right
    new_col = @current[:col] + 1
    @current[:col] = new_col unless get_current_number(col: new_col) == '#'
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
