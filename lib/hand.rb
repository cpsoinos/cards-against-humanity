class Hand

  attr_accessor :hand

  def initialize(deck)
    @hand = []
    10.times do
      @hand << deck.deal!
    end

  end

  def draw(deck)
    @hand << deck.deal!
  end

  def replenish(deck)
    until @hand.length == 10
      @hand << deck.draw!
    end
  end

  def remove_selected(index)
    @hand.delete_at(index)
  end

end
