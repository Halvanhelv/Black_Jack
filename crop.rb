# frozen_string_literal: true

class Crop < Player
  attr_accessor :cards, :bank, :main, :scoupe
  def initialize(cards, main, interface)
    super(cards, main, interface)
    @main = main
    @bank = 100
    @cards = cards
    @bank -= 10
    show_cards
  end

  def start
    show_cards
    @cards << Shuffle.add_card if @scoupe <= 17
    self
  end

  def add_card
    if cards.count == 2
      @cards << Shuffle.add_card
      show_cards
      Main.step(self)
    end
  end

  def show_cards
    @scoupe = interface.show_cards(@cards, self)
  end
  end
