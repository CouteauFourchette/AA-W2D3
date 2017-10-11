require_relative 'card'

class Deck

  def initialize
    @cards = Array.new
    populate
    @cards.shuffle!
  end

  def pick_card
    raise 'No cards left' if @cards.empty?
    @cards.shift
  end

  def length
    @cards.length
  end

  private

  def populate
    suits = Card.valid_suits
    suits.each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

end
