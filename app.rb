require 'pry'
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

get '/' do
  erb :index
end

get '/game' do
  session[:game] ||= Game.setup
  session[:game].players << Player.new(session[:user], game.white_deck)
  erb :game, locals: { game: session[:game] }
end

post '/signin' do
  session[:user] = params[:user]
  redirect '/game'
end
