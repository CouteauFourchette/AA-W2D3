class Hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
    5.times { @cards << deck.pick_card }
  end

  def discard(indices)
    raise 'Cannot discard more than three cards' if indices.length > 3
    new_cards = []
    indices.length.times { new_cards << @deck.pick_card }
    indices.each { |i| @cards[i] = new_cards.shift }
    @cards
  end

  protected

  def compare(hand)

  end

  def hand_score

  end

  private

  def straight_flush?
    return nil unless flush? && straight?
    straight?
  end

  def four_of_a_kind?(hash_val)
    return nil unless @cards.map(&:value).uniq == 2
    hash_val.sort_by { |k, v| -v }.map(&:first)
  end

  def full_house?
    return nil unless pair? && three_of_a_kind?
    three_of_a_kind
  end

  def flush?
    return nil unless @cards.map(&:suit).uniq.length == 1
    @cards.map(&:values).sort { |a, b| b <=> a }
  end

  def straight?
    values = @cards.map(&:value)
    values.sort
    if values.include?(1) && values.include?(13)
      values.shift
      values.push(14)
    end
    return nil unless (0..4).all? { |i| values[0] == values[i] - i }
    [values.last]
  end

  def three_of_a_kind?(hash_val)
    return nil unless hash_val.key(3)
    values = hash_val.sort_by { |k, v| -v }.map(&:first)
    [values[0]] + values[1..-1].sort { |a, b| b <=> a }
  end

  def two_pair(hash_val)
    return nil unless hash_val.values.count(2) == 2
    values = hash_val.sort_by { |k, v| -v }.map(&:first)
    values[0..1].sort { |a, b| b<=>a } + values[2..-1].sort { |a, b| b <=> a }
  end

  def pair?(hash_val)
    return nil unless hash_val.key(2)
    values = hash_val.sort_by { |k, v| -v }.map(&:first)
    [values[0]] + values[1..-1].sort { |a, b| b <=> a }
  end

end
