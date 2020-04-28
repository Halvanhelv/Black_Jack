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

  def show_cards
    @scoupe = if self.class == User
                interface.show_cards(@cards)
              else
                interface.show_diler_cards(@cards)
              end
  end

  def start
    main.step(self)
  end

  def add_card
    @cards << Shuffle.add_card
    show_cards
  end
end
