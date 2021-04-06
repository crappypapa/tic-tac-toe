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

describe '#cell_check' do
  it 'return true if cell selection is between 1 and 9' do
    cell = 4
    arr = [1,2,3]
    person = "ola"
    expect(cell_check(cell,person,arr,arr)).to eql (true)
  end

  it 'return false if selection is greater than 9' do
    cell = 11
    arr = [1,2,3]
    person = 'ola'
    expect(cell_check(cell,person,arr,arr)).to eql (false)
  end

  it 'return false if selection is lesser than 1' do
    cell = 0
    arr = [1,2,3]
    person = 'ola'
    expect(cell_check(cell,person,arr,arr)).to eql (false)
  end

  it 'return false if cell selection is not an integer' do
    cell = "str"
    arr = [1,2,6]
    person = 'ola'
    expect(cell_check(cell,person,arr,arr)).to eql (false)
  end

  it "return false if cell selection has been previously taken" do
    cell = 2
    arr1 = [1,2,6]
    arr2 = [3,5]
    person = 'ola'
    expect(cell_check(cell,person,arr1,arr2)).to eql (false)
  end

  it "return true if cell selection has not been previously taken" do
    cell = 4
    arr1 = [1,2,6]
    arr2 = [3,5]
    person = 'ola'
    expect(cell_check(cell,person,arr1,arr2)).to eql (true)
  end
end

