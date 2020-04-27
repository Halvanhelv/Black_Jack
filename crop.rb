# frozen_string_literal: true

class Crop < Player
  attr_accessor :cards, :bank, :main, :scoupe
  def initialize(cards, main)
    super(cards, main)
    @main = main
    @bank = 100
    @cards = cards
    @bank -= 10
  end

  def start
    show_cards
    @cards << Shuffle.add_card if @scoupe <= 17
    puts 'Сейчас идет Игрок'
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
    @scoupe = 0
    puts 'Карты диллера'

    @cards.each do |index|
      puts '[*,*]'
      @scoupe += index.include_card
    end
    puts 'У диллера * очков'
  end
  end
