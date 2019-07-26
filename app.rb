require './lib/word'
require './lib/definition'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload 'lib/**/*.rb'

get ('/') do

end
