require 'map'

RSpec.describe Map do
  context 'given examples' do
    it 'first' do
      map = Map.new('R2, L3')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 5
    end

    it 'second' do
      map = Map.new('R2, R2, R2')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 2
    end

    it 'third' do
      map = Map.new('R5, L5, R5, R3')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 12
    end

    it 'large numbers' do
      map = Map.new('R5, L125')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 130
    end
  end

  context 'given puzzle input' do
    it 'solution' do
      input = File.read('./input.txt')
      map = Map.new(input)
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 236
    end
  end
end
