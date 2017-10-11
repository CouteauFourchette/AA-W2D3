class Card

  VALID_VALUES = (1..13).to_a.freeze
  VALUES_STRINGS = { 1 => "A", 11 => "J", 12 => "Q", 13 => "K" }.freeze
  SUIT_STRINGS = { heart: "♥️", diamond: "♦️", spade: "♠️", clubs: "♣️" }.freeze

  attr_reader :value, :suit

  def initialize(value, suit)
    raise "Not a valid card number" unless VALID_VALUES.include?(value)
    raise "Not a valid suit" unless SUIT_STRINGS.include?(suit)
    @value = value
    @suit = suit
  end

  def color
    %i[heart diamond].include?(@suit) ? :red : :black
  end

  def to_s
    val_str = VALUES_STRINGS.include?(@value) ? VALUES_STRINGS[@value] : @value.to_s
    val_str + SUIT_STRINGS[@suit]
  end

  def self.valid_suits
    SUIT_STRINGS.keys
  end
end
