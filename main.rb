# frozen_string_literal: true

require_relative 'diler'
require_relative 'player'
require_relative 'shuffle'
class Main
  def initialize
    puts 'Введите имя'
    name = gets.chomp.to_s
    cards = Shuffle.new
    Player.new(name, cards.take_cards)
    Diler.new(cards.take_cards)
  end
end

Main.new
