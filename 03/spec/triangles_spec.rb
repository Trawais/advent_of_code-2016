require 'triangles'

RSpec.describe Triangles do
  it 'passes given example' do
    input = File.read('example.txt')
    triangles = Triangles.new(input)
    expect(triangles.get_valids).to eq 1
  end

  it 'passes' do
    input = File.read('input.txt')
    triangles = Triangles.new(input)
    expect(triangles.get_valids).to eq 869
  end
end
