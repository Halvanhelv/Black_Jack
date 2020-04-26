# frozen_string_literal: true

class Diler
  attr_accessor :cards, :bank
  def initialize(cards)
    @bank = 100
    @cards = cards
    show_cards
    @bank -= Game.start_party
    puts 'Действие'


  end

  def add_card
    if cards.count == 2


    end
  end
  def show_cards
    puts 'Карты диллера'
    count = 0

    @cards.each do |index|
      index.show
      count += index.include_card
    end
    puts "У вас #{count} очков"
  end

end
