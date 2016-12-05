# class for representing first task of advent of code 2016
class Map
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize(instructions)
    @shortest_path = 0
    @x_coord = 0
    @y_coord = 0
    @heading_to = NORTH
    @instructions = instructions
  end

  def shortest_path
    @x_coord.abs + @y_coord.abs
  end

  def execute_instructions_first_part
    @instructions.split(', ').each do |command|
      _, turn_to, blocks = /([LR])(\d+)/.match(command).to_a.flatten
      execute_turn(turn_to)
      execute_walk(blocks)
      #puts "heading to: #{@heading_to}, x: #{@x_coord}, y: #{@y_coord}"
    end
  end

  def execute_walk(blocks)
    blocks_count = blocks.to_i
    case @heading_to
    when NORTH
      @y_coord += blocks_count
    when EAST
      @x_coord += blocks_count
    when SOUTH
      @y_coord -= blocks_count
    when WEST
      @x_coord -= blocks_count
    end
  end

  def execute_turn(direction)
    case direction
    when 'L'
      turn_left
    when 'R'
      turn_right
    end
  end

  def turn_right
    @heading_to += 1
    @heading_to %= 4
  end

  def turn_left
    @heading_to -= 1
    @heading_to %= 4
  end
end
