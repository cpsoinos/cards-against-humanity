require 'pry'
require 'pg'
require 'sinatra'
# require 'sinatra-activerecord'
require 'rake'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/card'
require_relative 'lib/hand'
require_relative 'game.rb'

set :database, {adapter: "pg", database: "cards_against_humanity"}

configure :development, :test do
  require 'pry'
end

use Rack::Session::Cookie

get '/' do
  erb :index
end

get '/game' do
  session[:game] ||= Game.new
  session[:game].players << Player.new(session[:user], session[:game].white_deck)
  erb :game, locals: { game: session[:game] }
end

post '/signin' do
  session[:user] = params[:user]
  redirect '/game'
end
