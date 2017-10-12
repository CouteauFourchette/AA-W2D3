require 'rspec'
require 'hand'

describe Hand do
  let(:deck) { double('Deck') }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "have 5 cards" do
      allow(deck).to receive(:pick_card) { instance_double('Card') }
      expect(hand.cards.length).to eq(5)
    end

  end

  describe "#discard" do
    context "replaced 2 cards" do
      before(:each) do
        allow(deck).to receive(:pick_card) { rand }
      end

      it "replaces cards" do
        old_cards = hand.cards.dup
        hand.discard([0, 1])
        expect(old_cards[0]).to_not eq(hand.cards[0])
        expect(old_cards[1]).to_not eq(hand.cards[1])
      end

      it "keep cards that were NOT replaced" do
        old_cards = hand.cards.dup
        hand.discard([0, 1])
        expect(old_cards[2]).to eq(hand.cards[2])
        expect(old_cards[3]).to eq(hand.cards[3])
        expect(old_cards[4]).to eq(hand.cards[4])
      end

    end

    it "raises an error if more than 3 cards are replaced" do
      allow(deck).to receive(:pick_card) { rand }
      expect { hand.discard([0, 1, 2, 3]) }.to raise_error('Cannot discard more than three cards')
    end


  end

  describe "#compare" do
    subject(:hand2) { Hand.new }
    # let(:1card) { double() }


    it "compare high card hand with another high card hand" do
      hand.instance_variable_set[]

    end

    it "compare two pair hand with one pair hand"

    it "compare straight-flush hand with a straight hand"

  end


end
