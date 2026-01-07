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
      puts 'Welcome to Black Jack game'
      puts '1 Start game'
      puts '2 Exit game'
      case gets.chomp.to_i
      when 1
        puts 'Enter your name'
        Main.new(gets.chomp.to_s, self)
      when 2 then exit
      end
    end
  end

  def start(player)
    puts 'What do you want to do'
    puts '1 Add 1 card'
    puts '2 Skip turn'
    puts '3 Show cards'
    case gets.chomp.to_i
    when 1 then player.add_card
    when 2 then puts 'Dealer\'s turn'
    when 3 then player.main.winner?
    else
      raise 'please enter a valid option'
    end
    puts 'Dealer is playing now'
  end


  def win_diler(user, crop)
    puts "Player #{user.name} Lost. Score: dealer #{crop.scoupe} player #{user.name} #{user.scoupe} "
  end

  def win_player(user, crop)
    puts "Player #{user.name} Won. Score: dealer #{crop.scoupe} player #{user.name} #{user.scoupe} "
  end

  def show_diler_cards(cards)
    scoupe = 0
    puts 'Dealer\'s cards'

    cards.each do |index|
      puts '[*,*]'
      scoupe += index.include_card
    end
    puts 'Dealer has * points'
    scoupe
  end

  def show_cards(cards)

      scoupe = 0
      puts 'Your cards'
      cards.each do |index|
        index.show
        scoupe += index.include_card
      end
      puts "You have #{scoupe} points"
      scoupe

  end
  def start_menu
    puts 'What do you want to do?'
    puts '1 Play again?'
    puts '2 End game?'
  end
end
Game.new
