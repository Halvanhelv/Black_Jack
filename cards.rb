# frozen_string_literal: true

class Cards
  attr_accessor :suits, :value
  def initialize(suits, value)
    @value = value
    @suits = suits
  end

  def show
    puts [@value, @suits].to_s
  end

  def include_card
    count = 0
    count = value.to_i if [2, 3, 4, 5, 6, 7, 8, 9, 10].include? value.to_i
    count += 10 if %w[J Q K].include? value.to_s
    count
  end
end
