require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/models'
# require_relative 'lib/deck'
# require_relative 'lib/player'
# require_relative 'lib/card'
# require_relative 'lib/hand'
# require_relative 'lib/game'



use Rack::Session::Cookie



get '/' do
  erb :index
end

### wont' need for multiplayer
# get '/game' do
#   erb :game, locals: { game: game }
# end


post '/signin' do
  session[:user] = Player.create(name: params[:user], game_id: params[:game_id])

  #check if there's a game running with that id
  # session[:game] = Game.create(params[:game_id])

  redirect '/game/:game_id'
end

get '/game/:game_id' do

  erb :card
end

post '/name' do
  params.each do |key, user|
    game.players << Player.new(user, session[:game].white_deck)
  end

  redirect '/'
end
