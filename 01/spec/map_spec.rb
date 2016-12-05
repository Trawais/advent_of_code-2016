require 'map'

RSpec.describe Map do
  context 'First part' do
    it 'first example' do
      map = Map.new('R2, L3')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 5
    end

    it 'second example' do
      map = Map.new('R2, R2, R2')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 2
    end

    it 'third example' do
      map = Map.new('R5, L5, R5, R3')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 12
    end

    it 'example with larger number' do
      map = Map.new('R5, L125')
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 130
    end

    it 'solution' do
      input = File.read('./input.txt')
      map = Map.new(input)
      map.execute_instructions_first_part
      expect(map.shortest_path).to eq 236
    end
  end

  context 'second part' do
    it 'first example' do
      map = Map.new('R8, R4, R4, R8')
      map.execute_instructions_second_part
      expect(map.shortest_path).to eq 4
    end

    it 'solution' do
      input = File.read('./input.txt')
      map = Map.new(input)
      map.execute_instructions_second_part
      expect(map.shortest_path).to eq 182
    end
  end
end
