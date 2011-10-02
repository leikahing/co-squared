#!/usr/bin/env ruby

require 'sinatra'
require 'haml'
require 'sass'
require 'data_mapper'

configure do
  Compass.configuration do |config|
    config.sass_dir = 'views/css'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

helpers do
end

get '/blog' do

  haml :blog_index
end
