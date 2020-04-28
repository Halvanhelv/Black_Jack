# frozen_string_literal: true

class User < Player
  attr_reader :name, :scoupe
  def initialize(name, cards, main, interface)
    @name = name
    @scoupe = 0
    super(cards, main, interface)
  end

  def start
    show_cards

    interface.start(self)
    self
  end


rescue RuntimeError => e
  puts e.message.to_s
  retry
end
