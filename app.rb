require 'pg'
require 'sinatra'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/card'

configure :development, :test do
  require 'pry'
end

get '/' do
  redirect '/game'
end

get '/game' do

  erb :foundation, locals: {}
end
