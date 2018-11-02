require 'ipv7'

RSpec.describe IPv7 do
  context 'first part' do
    it "example" do
      signal = SignalAndNoise.new('example.txt')
      expect(signal.first_part).to eq 'easter'
    end
  end
end