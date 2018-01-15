require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require_relative './models/zoo.rb'
require_relative './controllers/zoo_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run ZooController