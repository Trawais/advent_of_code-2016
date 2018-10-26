require 'md5_password'

RSpec.describe MD5Password do
  context 'first part' do
    it "finds the solution for example" do
      password = MD5Password.new()
      expect(password.find_password('abc')).to eq '18f47a30'
    end

    it "finds the solution for input" do
      password = MD5Password.new()
      expect(password.find_password('ugkcyxxp')).to eq 'd4cd2ee1'
    end
  end

  context 'second part' do
    it 'finds the solution for example' do
      password = MD5Password.new()
      expect(password.find_second_password('abc')).to eq '05ace8e3'
    end

    it 'finds the solution for input' do
      password = MD5Password.new()
      expect(password.find_second_password('ugkcyxxp')).to eq 'f2c730e5'
    end
  end
end
