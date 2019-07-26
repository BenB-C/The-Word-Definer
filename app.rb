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

get '/words/new' do
  erb(:new_word)
end

post '/new_word' do
  word = Word.new({ :text => params[:word_text] })
  word.save
  redirect to '/words'
end
