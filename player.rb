# frozen_string_literal: true
require_relative 'game'
class Player
  attr_accessor :bank, :name, :cards
  def initialize(name, cards)
    @bank = 100
    @name = name
    @cards = cards
    start
    @bank -= Game.start_party

  end

  def start
    show_cards
    case gets.chomp.to_s
    when 1 then add_card
    end
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
