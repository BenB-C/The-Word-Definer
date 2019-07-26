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

get '/words/:id/definitions' do
  id = params[:id].to_i
  @word = Word.find(id)
  @definitions = Definition.find_by_word(id)
  erb(:definitions)
end

get '/words/:id/definitions/new' do
  @word = Word.find(params[:id].to_i)
  erb(:new_definition)
end

post '/words/:id/definitions/new_definition' do
  word = Word.find(params[:id].to_i)
  definition = Definition.new({
    :text => params[:definition_text],
    :word_id => word.id
  })
  definition.save
  # @definitions = Definition.all
  # erb(:definitions)
  redirect to "/words/#{word.id}/definitions"
end
