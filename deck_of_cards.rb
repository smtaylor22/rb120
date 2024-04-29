class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @shuffled_deck = reset_deck
  end

  def reset_deck
    new_deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        new_deck << Card.new(rank, suit)
      end
    end
    new_deck.shuffle
  end


  def draw
    card = @shuffled_deck.pop
    if card == nil
      @shuffled_deck = reset_deck
      @shuffled_deck.pop
    else
      card
    end
  end
end




deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.