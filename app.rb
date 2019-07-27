require './lib/word'
require './lib/definition'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload 'lib/**/*.rb'

get '/' do
  # redirect to '/words'
  @words = Word.all
  erb(:words)
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
  redirect to "/words/#{word.id}/definitions"
end

get '/words/:word_id/definitions/:id' do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:id].to_i)
  erb(:edit_definition)
end

post '/words/:word_id/definitions/:id/edit_definition' do
  @definition = Definition.find(params[:id].to_i)
  @definition.update(params[:definition_text])
  redirect to "/words/#{params[:word_id].to_i}/definitions"
end

post '/words/:word_id/definitions/:id/delete_definition' do
  @definition = Definition.find(params[:id].to_i)
  @definition.delete
  redirect to "/words/#{params[:word_id].to_i}/definitions"
end
