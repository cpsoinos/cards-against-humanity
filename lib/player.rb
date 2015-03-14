class Player

  attr_accessor :hand, :name

  def initialize(name)
    @hand = []
    @name = name
  end

  def draw(card)
    @hand << card
  end

  

end
