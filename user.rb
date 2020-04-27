# frozen_string_literal: true

class User < Player
  attr_reader :name, :scoupe
  def initialize(name, cards, main)
    @name = name
    @scoupe = 0
    super(cards, main)
  end

  def start
    show_cards
    puts 'Что вы хотите сделать'
    puts '1 Добавить себе 1 карту'
    puts '2 Пропустить ход'
    puts '3 Вскрыть карты'
    case gets.chomp.to_i
    when 1 then add_card
    when 2 then puts 'Ход диллера'
    when 3 then main.winner?
    else
      raise 'пожалуйста введите правильный вариант'
    end
    puts 'Сейчас идет диллер'
    self
  end

  def show_cards
    @scoupe = 0
    puts 'Ваши карты'
    @cards.each do |index|
      index.show
      @scoupe += index.include_card
    end
    puts "У вас #{@scoupe} очков"
  end
rescue RuntimeError => e
  puts e.message.to_s
  retry
end
