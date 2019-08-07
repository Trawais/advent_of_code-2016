require 'ipv7'

RSpec.describe IPv7 do
  context 'first part' do
    it "example 1" do
      ipv7 = IPv7.new()
      expect(ipv7.tls?('abba[mnop]qrst')).to eq true
    end
    it "example 2" do
      ipv7 = IPv7.new()
      expect(ipv7.tls?('abcd[bddb]xyyx')).to eq false
    end
    it "example 3" do
      ipv7 = IPv7.new()
      expect(ipv7.tls?('aaaa[qwer]tyui')).to eq false
    end
    it "example 4" do
      ipv7 = IPv7.new()
      expect(ipv7.tls?('ioxxoj[asdfgh]zxcvbn')).to eq true
    end

    it "example 101" do
      ipv7 = IPv7.new()
      expect(ipv7.tls?('wdqcwcbtpexduecepe[zwrcpctlwglgfpappb]zdadimzdcpxhxwde[yquulvwgyyzwcfsvkdt]thgziwclyxxfyjpbpc[ypkjfrfkxlkavboh]hxylcecamgezuoljh')).to eq false
    end

    it "given puzzle input" do
      ipv7 = IPv7.new()
      expect(ipv7.from_file('input.txt')).to eq 118
    end
  end

  context 'second part' do
    it "example 1" do
      ipv7 = IPv7.new()
      expect(ipv7.ssl?('aba[bab]xyz')).to eq true
    end
  end
end