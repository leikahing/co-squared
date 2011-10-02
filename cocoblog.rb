#!/usr/bin/env ruby

require 'sinatra'
require 'haml'
require 'sass'
require 'data_mapper'
require 'logger'
require_relative 'app/models'

configure do
#  Compass.configuration do |config|
#    config.sass_dir = 'views/css'
#  end

  set :haml, { :format => :html5 }
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/test.db")
  DataMapper::Logger.new(STDOUT, :debug)
#  set :sass, Compass.sass_engine_options
end

#helpers do
#end

#get '/' do
#  haml :blog_index
#end

get '/page/:id' do |id|
  print "id is #{id}\n"
  @page = Post.get(id)
  print @page.body
  haml :page
end
