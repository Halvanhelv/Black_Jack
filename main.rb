# frozen_string_literal: true

class Main
  attr_reader :player, :crop, :user
  def initialize
    puts 'Введите имя'
    name = gets.chomp.to_s
    cards = Shuffle
    @crop = Crop.new(cards.take_cards, self)
    @user = User.new(name, cards.take_cards, self)

    start(user)
  end

  def winner?
    if @user.scoupe < 21 && @user.scoupe > @crop.scoupe
      puts "Игрок #{@user.name} Победил.  Cчет: диллера #{@crop.scoupe} игрока #{@user.name} #{@user.scoupe} #{@user.show_cards} "
    elsif @crop.scoupe < 21
      puts "Игрок #{@user.name} Проиграл Cчет: диллера #{@crop.scoupe} игрока #{@user.name} #{@user.scoupe} #{@crop.show_cards}"
    else
      puts 'Ничья'
    end
    puts 'Что вы хотите сделать?'
    puts '1 Сыграть снова?'
    puts '2 Закончить игру?'
    case gets.chomp.to_i
    when 1 then Main.new
    when 2 then exit
    else
      exit
    end
  end

  def who_win?
    winner? if user.cards.count > 2 && crop.cards.count > 2
  end

  def start(player)
    who_win?
    step = player.start
    if step == user
      start(crop)
    else
      start(user)
    end
  end
end
