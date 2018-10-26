require 'digest'

# Five task class
class MD5Password
  def initialize
    @first_result = ''
    @second_result = Array.new(8)
    @index = 0
  end

  def get_md5_hash(input_string)
    Digest::MD5.hexdigest(input_string + @index.to_s)
  end

  def find_password(input_string)
    while @first_result.length < 8
      hash = get_md5_hash input_string
      if hash.start_with? '00000'
        @first_result << hash[5]
        puts 'Partial result: ' + @first_result
      end
      @index += 1
    end
    @first_result
  end

  def find_second_password(input_string)
    until @second_result.all?
      hash = get_md5_hash input_string
      handle_positive_hash hash if hash.start_with? '00000'
      @index += 1
    end
    @second_result.join
  end

  def handle_positive_hash(hash)
    position = hash[5].to_i(16)
    value = hash[6]
    if (position <= 7) && (!@second_result[position])
      @second_result[position] = value
    end
    puts 'Partial result: ' + @second_result.join('|')
  end
end
