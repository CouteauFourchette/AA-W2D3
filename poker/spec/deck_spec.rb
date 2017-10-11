require 'deck'
require 'rspec'

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "has 52 cards" do
      expect(deck.length).to eq(52)
    end

    it "each card is unique" do
      cards = deck.instance_variable_get(:@cards)
      expect(cards.uniq).to eq(cards)
    end

    it "shuffled" do
      cards = deck.instance_variable_get(:@cards)
      sorted_cards = cards.sort_by(&:value)
      expect(cards).to_not eq(sorted_cards)
    end
  end

  describe "#pick_card" do
    it "removes a card from the deck" do
      deck.pick_card
      expect(deck.length).to eq(51)
    end

    it "returns a card" do
      card = deck.pick_card
      expect(card).to be_a(Card)
    end

    it "raise error if no card left" do
      52.times { deck.pick_card }
      expect { deck.pick_card }.to raise_error('No cards left')
    end
  end
end
