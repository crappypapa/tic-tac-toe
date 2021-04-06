require_relative '../bin/main'
require_relative '../lib/logic'
require_relative '../lib/player'

describe Player do
  describe '#name_check' do
    it 'checks if length of name given is greater than 0' do
      player = Player.new
      expect(player.name_check("")).to eql(false)
    end

    it 'checks if length of name given is greater than 0' do
      player = Player.new
      expect(player.name_check("ola")).to eql(true)
    end
  end
end


