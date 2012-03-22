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

# Compile and serve coffeescript files
class CoffeeHandler < Sinatra::Base
  
  set :views, File.dirname(__FILE__) + '/js'

  get '/js/*.js'  do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

# Application class
class Splash < Sinatra::Base
  use SassHandler
  use CoffeeHandler

  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    haml :index
  end
end

Splash.run! :port => 4000