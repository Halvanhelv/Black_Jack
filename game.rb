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
        Main.new(gets.chomp.to_s)
      when 2 then exit
      end
    end
  end
end
Game.new
