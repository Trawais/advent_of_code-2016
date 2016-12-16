require 'triangles'

RSpec.describe Triangles do
  context 'first part' do
    it 'passes given example' do
      input = File.read('example.txt')
      triangles = Triangles.new(input)
      expect(triangles.count_triangles).to eq 2
    end

    it 'passes' do
      input = File.read('input.txt')
      triangles = Triangles.new(input)
      expect(triangles.count_triangles).to eq 869
    end
  end

  context 'second part' do
    it 'passes on example' do
      input = File.read('example.txt')
      triangles = Triangles.new(input)
      triangles.invert_lines_for_second_part!
      expect(triangles.count_triangles).to eq 2
    end

    it 'passes' do
      input = File.read('input.txt')
      triangles = Triangles.new(input)
      triangles.invert_lines_for_second_part!
      expect(triangles.count_triangles).to eq 1544
    end
  end
end
