require 'towers_of_hanoi'
require 'rspec'

describe TowerOfHanoi do
  subject(:game) { TowerOfHanoi.new }

  describe "#initalize" do
    it "it creates three arrays" do
      expect(game.rods.length).to eq(3)
    end

    it "initialize first with every disk rod in right order" do
      expect(game.rods[0].sort).to eq(game.rods[0])
      expect(game.rods[1]).to be_empty
      expect(game.rods[2]).to be_empty
    end
  end

  describe "#move" do

    it "moves the disk to an array" do
      game.move(0,1)
      expect(game.rods[0].length).to eq(2)
      expect(game.rods[1].length).to eq(1)
    end

    it "raise an exception if the size of the bottom disk is smaller" do
      game.move(0,1)
      expect { game.move(0,1) }.to raise_error("Cannot move to lower disk")
    end

    it "raises an exception if there is no rod to move" do
      expect { game.move(1,0) }.to raise_error("No disk in rod")
    end

  end

  describe "#won?" do
    it "wins if all disks are in one rod" do
      game.rods = [[],[1,2,3],[]]
      expect(game.won?).to be(true)
    end

    it "doesn't win if it's in starting rod" do
      expect(game.won?).to be(false)
    end

  end
end
