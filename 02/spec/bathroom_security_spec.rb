require 'bathroom_security'

RSpec.describe BathroomSecurity do
  context 'first part' do
    before(:each) do
      @bath_sec = BathroomSecurity.new(2, 2)
    end

    it 'initial state' do
      expect(@bath_sec.get_current_number).to eq '5'
    end

    it 'two moves up' do
      2.times { @bath_sec.move_up }
      expect(@bath_sec.get_current_number).to eq '2'
    end

    it 'two moves down' do
      2.times { @bath_sec.move_down }
      expect(@bath_sec.get_current_number).to eq '8'
    end

    it 'two moves left' do
      2.times { @bath_sec.move_left }
      expect(@bath_sec.get_current_number).to eq '4'
    end

    it 'two moves right' do
      2.times { @bath_sec.move_right }
      expect(@bath_sec.get_current_number).to eq '6'
    end

    it 'passes given example' do
      input = File.read('example.txt')
      @bath_sec.execute_instructions(input)
      expect(@bath_sec.get_code).to eq '1985'
    end

    it 'passes' do
      input = File.read('input.txt')
      @bath_sec.execute_instructions(input)
      expect(@bath_sec.get_code).to eq '12578'
    end
  end

  context 'second part' do
    before(:each) do
      @bath_sec = BathroomSecurity.new(3, 1, true)
    end

    it 'initial state' do
      expect(@bath_sec.get_current_number).to eq '5'
    end

    it 'passes given example' do
      input = File.read('example.txt')
      @bath_sec.execute_instructions(input)
      expect(@bath_sec.get_code).to eq '5DB3'
    end

    it 'passes' do
      input = File.read('input.txt')
      @bath_sec.execute_instructions(input)
      expect(@bath_sec.get_code).to eq '516DD'
    end
  end
end
