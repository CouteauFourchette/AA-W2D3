require 'card'
require 'rspec'

RSpec.describe Card do

  subject(:card) { Card.new(13, :heart) }

  describe "#initialize" do
    it "has a value" do
      expect(card.value).to eq(13)
    end

    it "has a suit" do
      expect(card.suit).to eq(:heart)
    end

    it "raises an exception if a card number is not valid" do
      expect { Card.new(14, :heart) }.to raise_error("Not a valid card number")
    end

    it "raises an exception if a suit is not valid" do
      expect { Card.new(2, :cat) }.to raise_error("Not a valid suit")
    end

    it "has the correct color" do
      expect(card.color).to eq(:red)
    end


  end

  describe "#to_s" do
    it "contains the suit and value and color" do
      expect(card.to_s).to eq("K♥️")
    end


  end


end
