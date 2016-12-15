class Triangles
  def initialize(input)
    @lines = input.each_line
  end

  def get_valids
    result = 0
    @lines.each do |line|
      result += 1 if triangle?(line)
    end
    result
  end

  def triangle?(triple)
    all_vars = 0
    triple.split.permutation.to_a.each do |variation|
      if variation[0].to_i + variation[1].to_i > variation[2].to_i
        all_vars += 1
      end
    end
    return all_vars == 6 ? true : false
  end
end
