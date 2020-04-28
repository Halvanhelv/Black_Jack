# frozen_string_literal: true

class Main
  attr_reader :player, :crop, :user, :name, :interface
  def initialize(name, interface)
    @interface = interface
    @name = name
    cards = Shuffle
    @crop = Crop.new(cards.take_cards, self, interface)
    @user = User.new(name, cards.take_cards, self, interface)

    start(user)
  end

  def winner?
    if @user.scoupe < 21 && @user.scoupe > @crop.scoupe
      interface.win_player(@user, @crop)
    elsif @crop.scoupe < 21
      interface.win_diler(@user, @crop)
    else
      puts 'Ничья'
    end
    interface.start_menu
    case gets.chomp.to_i
    when 1 then Main.new(@user.name, interface)
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
