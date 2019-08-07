# frozen_string_literal: true

# Task 07 class
class IPv7
  def tls?(address)
    get_hypernets(address).each do |hypernet|
      return false if contains_tls?(hypernet)
    end
  
    get_supernets(address).each do |supernet|
      return true if contains_tls?(supernet)
    end
    false
  end

  def from_file(file)
    supports_tls = 0
    File.readlines(file).each do |line|
      supports_tls += 1 if tls?(line.strip)
    end
    supports_tls
  end

  def ssl?(address)
    true
  end

  private

  def contains_tls?(subaddress)
    i = 0
    while i < subaddress.length - 3
      if subaddress[i..i + 1].reverse == subaddress[i + 2..i + 3] &&
         subaddress[i] != subaddress[i + 1]
        return true
      end

      i += 1
    end
    false
  end

  # hypernet => parts INside square brackets
  def get_hypernets(address)
    address.scan(/\[(\w+?)\]/).map(&:first)
  end

  # supernet => parts OUTside square brackets
  def get_supernets(address)
    address.gsub!(/\[\w+?\]/, '#').split('#')
  end
end
