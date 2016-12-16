class RealRooms
  def initialize(input)
    @input = input
  end

  def sum_ids
    sum = 0
    @input.each_line do |line|
      encrypted_name, id, hash_code = parse_line(line)
      sum += id.to_i if real_room?(encrypted_name, hash_code)
    end
    sum
  end

  def parse_line(line)
    _, name, id, hash_code = /([a-z-]+)-(\d+)\[([a-z]+)\]/.match(line).to_a.flatten
    return name, id, hash_code
  end

  def real_room?(name, hash_code)
    counting = Hash.new(0)
    name.gsub!('-', '').each_char { |chr| counting[chr] += 1 }
    computed_hash_code = counting.sort_by { |key, _value| key }.sort { |a, b| b[1] <=> a[1] }.take(5).map { |k, _v| k }.join
    return computed_hash_code == hash_code ? true : false
  end
end
