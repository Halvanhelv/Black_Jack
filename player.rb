# frozen_string_literal: true

require_relative 'game'
class Player
  attr_accessor :bank, :name, :cards, :main
  def initialize(name, cards, main)
    @main = main
    @bank = 100
    @name = name
    @cards = cards
    @bank -= Game.start_party
  end

  def start
    show_cards
    case gets.chomp.to_i
    when 1 then add_card
    end
  end

  def add_card
    @cards << Shuffle.add_card
    show_cards
    main.step(self)
  end

  def show_cards
    count = 0
    puts 'Ваши карты'
    @cards.each do |index|
      index.show
      count += index.include_card
    end
    puts "У вас #{count} очков"
  end
end
