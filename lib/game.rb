class Game

  attr_reader :white_deck, :black_deck, :id
  attr_accessor :players

  def initialize(id)
    @id = id
    @white_deck = Deck.new("white")
    @black_deck = Deck.new("black")
    @players = []
    @cards_in_play = {}
  end

  def number_of_players
    player_count = @players.length
  end

  def choose_judge
    judge = players.sample
    judge.make_judge
    judge
  end

  # judge picks a black card
  def generate_black_card
    black_deck.deal!
    # ERB: puts "Black card: #{black_card.text}"
  end

  def player_submit_white_card
  # need to show the black card, player needs to pick white card from hand
    players.each do |player|
      unless player.judge
        # ERB: print "Choose a card from hand: "
        index = gets.chomp.to_i
        # will need player input for index variable
        cards_in_play[player.name] = player.submit(index)
      end
    end
  end

  def select_winner
    # judge chooses winning card
    winning_card = judge.judge_choose(cards_in_play)
    winner = cards_in_play.key(winning_card)
    # ERB: puts "#{winner} wins this round!"
  end
end
