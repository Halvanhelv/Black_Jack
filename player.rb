# frozen_string_literal: true

class Player
  attr_accessor :bank, :name, :cards, :main, :scoupe
  def initialize(cards, main)
    @main = main
    @bank = 100
    @cards = cards
    @bank -= 10
  end

  def start
    main.step(self)
  end

  def add_card
    @cards << Shuffle.add_card
    show_cards
  end
end
