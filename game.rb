require 'pry'
require 'gosu'
require 'pg'
require 'sinatra'
require_relative 'lib/gosu'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/card'

# window = GameWindow.new
# window.show

deck = Deck.new("white")
corey = Player.new("Corey)")

# binding.pry
puts deck
puts corey
