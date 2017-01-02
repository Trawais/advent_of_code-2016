require 'real_rooms'

RSpec.describe RealRooms do
  context 'first part' do
    it 'passes all first example' do
      real_rooms = RealRooms.new('aaaaa-bbb-z-y-x-123[abxyz]')
      expect(real_rooms.sum_ids).to eq 123
    end

    it 'passes all second example' do
      real_rooms = RealRooms.new('aaaaa-bbb-z-yy-x-456[abyxz]')
      expect(real_rooms.sum_ids).to eq 456
    end

    it 'passes all third example' do
      real_rooms = RealRooms.new('a-b-c-d-e-f-g-h-987[abcde]')
      expect(real_rooms.sum_ids).to eq 987
    end

    it 'passes all fourth example' do
      real_rooms = RealRooms.new('not-a-real-room-404[oarel]')
      expect(real_rooms.sum_ids).to eq 404
    end

    it 'passes all fifth example' do
      real_rooms = RealRooms.new('totally-real-room-200[decoy]')
      expect(real_rooms.sum_ids).to eq 0
    end

    it 'passes given examples' do
      input = File.read('example.txt')
      real_rooms = RealRooms.new(input)
      expect(real_rooms.sum_ids).to eq 1_514
    end

    it 'passes on given input' do
      input = File.read('input.txt')
      real_rooms = RealRooms.new(input)
      expect(real_rooms.sum_ids).to eq 361_724
    end
  end

  context 'second part' do
    it 'decrypt name properly' do
      real_rooms = RealRooms.new('')
      expect(real_rooms.decrypt_name('abc-def-ghi', 1)).to eq 'bcd efg hij'
      expect(real_rooms.decrypt_name('x-y-z', 3)).to eq 'a b c'
      expect(real_rooms.decrypt_name('qzmt-zixmtkozy-ivhz', 343)).to eq 'very encrypted name'
    end

    it 'finds where "North Pole" is' do
      input = File.read('input.txt')
      real_rooms = RealRooms.new(input)
      expect(real_rooms.find_north_pole).to eq 482
    end
  end
end
