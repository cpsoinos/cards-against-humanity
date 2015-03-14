require 'pry'
require 'pg'
require 'sinatra'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/card'
require_relative 'lib/hand'

white_deck = Deck.new("white")
black_deck = Deck.new("black")


player1 = Player.new("Corey", white_deck)
player2 = Player.new("Liz", white_deck)

players = [player1, player2]

cards_in_play = {}

# pick a judge
judge = players.sample
judge.make_judge

# judge picks a black card
black_card = black_deck.deal!
puts "Black card: #{black_card.text}"

# need to show the black card, player needs to pick white card from hand
players.each do |player|
  unless player.judge
    print "Choose a card from hand: "
    index = gets.chomp.to_i
    # binding.pry
    # will need player input for index variable
    cards_in_play[player.name] = player.submit(index)
  end
end

# judge chooses winning card
winning_card = judge.judge_choose(cards_in_play)

# name of winner
winner = cards_in_play.key(winning_card)

# binding.pry
#
# # need to get the name of the player who submitted winning card
# if winning_card (cards_in_play)
#   # returns a card
#   # player wins this round, gets black_card as trophy
#   # player score += 1
#   # move on to next turn
# end
#
#
# # binding.pry
