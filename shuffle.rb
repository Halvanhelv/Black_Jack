# frozen_string_literal: true

class Shuffle
  CARD_SUITS = %w[♡ ♧ ♢ ♤].freeze
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_accessor :cards

  def self.take_cards
    @cards = generate_cards.pop(2)
  end

  def self.add_card
    generate_cards.pop
  end

  def self.generate_cards
    cards = []
    CARD_SUITS.each do |suit|
      CARD_VALUES.each do |value|
        cards << Cards.new(suit, value)
      end
    end
    cards.shuffle
  end
end
