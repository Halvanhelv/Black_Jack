# frozen_string_literal: true

require_relative 'player'
require_relative 'crop'
require_relative 'cards'
require_relative 'player'
require_relative 'main'
require_relative 'shuffle'
require_relative 'user'

class Game
  def initialize
    go
  end

  def go
    loop do
      puts 'Добро пожаловать в игру Black Jack'
      puts '1 Начать игру'
      puts '2 Закрыть игру'
      case gets.chomp.to_i
      when 1
        puts 'Введите свое имя'
        Main.new(gets.chomp.to_s, self)
      when 2 then exit
      end
    end
  end

  def start(player)
    puts 'Что вы хотите сделать'
    puts '1 Добавить себе 1 карту'
    puts '2 Пропустить ход'
    puts '3 Вскрыть карты'
    case gets.chomp.to_i
    when 1 then player.add_card
    when 2 then puts 'Ход диллера'
    when 3 then player.main.winner?
    else
      raise 'пожалуйста введите правильный вариант'
    end
    puts 'Сейчас идет диллер'
  end


  def win_diler(user, crop)
    puts "Игрок #{user.name} Проиграл Cчет: диллера #{crop.scoupe} игрока #{user.name} #{user.scoupe} "
  end

  def win_player(user, crop)
    puts "Игрок #{user.name} Победил.  Cчет: диллера #{crop.scoupe} игрока #{user.name} #{user.scoupe} "
  end

  def show_diler_cards(cards)
    scoupe = 0
    puts 'Карты диллера'

    cards.each do |index|
      puts '[*,*]'
      scoupe += index.include_card
    end
    puts 'У диллера * очков'
    scoupe
  end

  def show_cards(cards, player)
    if player.class == User
      scoupe = 0
      puts 'Ваши карты'
      cards.each do |index|
        index.show
        scoupe += index.include_card
      end
      puts "У вас #{scoupe} очков"
      scoupe
    else
      show_diler_cards(cards)
    end
  end
  def start_menu
    puts 'Что вы хотите сделать?'
    puts '1 Сыграть снова?'
    puts '2 Закончить игру?'
  end
end
Game.new
