require 'rubygems'
require 'bundler'
require 'sinatra'

# Compile and serve css files
class SassHandler < Sinatra::Base
  
  set :views, File.dirname(__FILE__) + '/css'

  get '/css/*.css'  do
    filename = params[:splat].first
    sass filename.to_sym
  end
end

# Application class
class Splash < Sinatra::Base
  use SassHandler

  set :public_folder, File.dirname(__FILE__) + '/static'
  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    haml :index
  end
end

Splash.run! :port => 4000