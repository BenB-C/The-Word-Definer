require './lib/word'
require './lib/definition'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload 'lib/**/*.rb'

get '/' do
  redirect to '/words'
end

get '/words' do
  @words = Word.all
  erb(:words)
end
