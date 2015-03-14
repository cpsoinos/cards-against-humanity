class Player

  attr_accessor :name, :judge, :hand, :deck

  def initialize(name, deck)
    @name = name
    @hand = Hand.new(deck)
    @judge = false
  end

  def make_judge
    @judge = true
  end

  def submit(index)
    @hand.remove_selected(index)
  end

  def judge_choose_winner(cards_in_play)
    # judge chooses a white card from submissions
    # passes in a hash
    cards_in_play.values.each do |card|
      puts card.text
    end
    print "Judge, choose the index of the winner: "
    choice = gets.chomp.to_i
    # binding.pry
    cards_in_play.values[choice]
    # returns the name of the player and the selected card (element from the hash)
  end

end
