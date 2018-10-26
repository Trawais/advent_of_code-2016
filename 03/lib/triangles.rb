# class for solvin third day of advent_of_code_2016
class Triangles
  def initialize(input)
    @lines = input.each_line.to_a.map(&:split)
  end

  def count_triangles
    result = 0
    @lines.each do |line|
      result += 1 if triangle?(line)
    end
    result
  end

  def triangle?(sides)
    sorted = sides.map(&:to_i).sort
    sorted[0] + sorted[1] > sorted[2]
  end

  def invert_lines_for_second_part!
    new_lines = []
    loop do
      break if @lines.empty?

      three_rows = @lines.shift(3)
      new_lines += three_rows.transpose
    end
    @lines = new_lines
  end
end
