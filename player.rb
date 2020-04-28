# frozen_string_literal: true

class Player
  attr_accessor :bank, :name, :cards, :main, :scoupe, :interface
  def initialize(cards, main, interface)
    @main = main
    @interface = interface
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
