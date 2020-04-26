# frozen_string_literal: true

class Crop
  attr_accessor :cards, :bank, :count,:main
  def initialize(cards,main)
    @main = main
    @bank = 100
    @cards = cards
    @bank -= Game.start_party
    show_cards

  end

  def start

    @cards << Shuffle.add_card if @count <= 17
    show_cards
    main.step(self)

  end

  def add_card
    if cards.count == 2
      @cards << Shuffle.add_card
      show_cards
      Main.step(self)
    end
  end

  def show_cards
    @count = 0
    puts 'Карты диллера'

    @cards.each do |index|
      index.show
      @count += index.include_card
    end
    puts "У диллера #{count} очков"
  end
  end
