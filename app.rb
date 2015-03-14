require 'pg'
require 'sinatra'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/card'
require_relative 'lib/hand'
require_relative 'game.rb'

configure :development, :test do
  require 'pry'
end

use Rack::Session::Cookie

game = Game.new

get '/' do
  erb :index
end

get '/game' do
  erb :game, locals: { game: game }
end

get '/card' do
  erb :card, locals: { game: game}
end

post '/signin' do
  session[:user] = params[:user]
  redirect '/game'
end

post '/name' do
  params.each do |key, user|
    game.players << Player.new(user,game.white_deck)
  end

  redirect '/card'
end
