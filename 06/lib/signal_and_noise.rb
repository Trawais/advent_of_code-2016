# Task six
class SignalAndNoise
  def initialize(input_file_path)
    @file_path = input_file_path
  end

  def prepare_columns
    cols = []
    File.readlines(@file_path).each do |line|
      line.strip.split('').each_with_index do |v, i|
        cols[i] << v if cols[i]
        cols[i] = [v] unless cols[i]
      end
    end
    cols
  end

  def first_part
    cols = prepare_columns

    result = ''
    cols.each do |col|
      freq = col.each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }
      result << col.max_by { |v| freq[v] }
    end
    result
  end

  def second_part
    cols = prepare_columns

    result = ''
    cols.each do |col|
      freq = col.each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }
      result << col.min_by { |v| freq[v] }
    end
    result
  end
end
