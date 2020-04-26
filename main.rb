# frozen_string_literal: true

require_relative 'crop'
require_relative 'player'
require_relative 'shuffle'
class Main
  attr_reader :player, :crop
  def initialize
    puts 'Введите имя'
    name = gets.chomp.to_s
    cards = Shuffle
    @player = Player.new(name, cards.take_cards, self)
    @crop = Crop.new(cards.take_cards, self)
    start(player)
  end

  def step(user)
    if user.class == Player
      @crop.start
    elsif user.class == Crop
      @player.start
    end
  end

  def start(unit)
    unit.start
  end
end

Main.new
