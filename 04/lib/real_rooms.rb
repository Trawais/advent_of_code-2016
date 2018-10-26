# class for fourth task
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
    /([a-z-]+)-(\d+)\[([a-z]+)\]/.match(line).to_a.flatten.last(3)
  end

  def real_room?(name, hash_code)
    counting = Hash.new(0)
    name.delete('-').each_char { |chr| counting[chr] += 1 }
    computed_hash_code = counting.sort_by { |key, _value| key }
                                 .sort { |a, b| b[1] <=> a[1] }
                                 .take(5)
                                 .map { |k, _v| k }
                                 .join
    computed_hash_code == hash_code
  end

  def find_north_pole
    @input.each_line do |line|
      encrypted_name, id, _hash_code = parse_line(line)
      room_name = decrypt_name(encrypted_name, id.to_i)
      return id.to_i if room_name =~ /northpole object/i
    end
  end

  def decrypt_name(room_name, shift_count)
    shift_count.times do
      room_name = shift_once(room_name)
    end
    room_name
  end

  def shift_once(input_string)
    input_string.each_char.map do |chr|
      ['-', ' '].include?(chr) ? ' ' : chr.succ[-1]
    end.join
  end
end
