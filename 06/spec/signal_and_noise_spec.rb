require 'signal_and_noise'

RSpec.describe SignalAndNoise do
  context 'first part' do
    it "example" do
      signal = SignalAndNoise.new('example.txt')
      expect(signal.first_part).to eq 'easter'
    end

    it "input" do
      signal = SignalAndNoise.new('input.txt')
      expect(signal.first_part).to eq 'dzqckwsd'
    end
  end

  context 'second part' do
    it "example" do
      signal = SignalAndNoise.new('example.txt')
      expect(signal.second_part).to eq 'advent'
    end

    it "input" do
      signal = SignalAndNoise.new('input.txt')
      expect(signal.second_part).to eq 'lragovly'
    end
  end
end