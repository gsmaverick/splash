require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/assetpack'

# Application class
class Splash < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'js'        # Optional
    serve '/css',    from: 'css'       # Optional
    serve '/images', from: 'images'    # Optional

    # Javascript file groupings
    js :desktop, '/js/desktop.js', [
      '/js/vendor/jquery.js',
      '/js/vendor/underscore.js',
      '/js/vendor/backbone.js',
      '/js/vendor/handlebars.js',
      '/js/*.js',
      '/js/models/*.js'
    ]

    js :slim, '/js/slim.js', [
      '/js/vendor/jquery.js',
      '/js/vendor/jquery.waypoints.js',
    ]


    css :application, '/css/application.css', [
      '/css/normalize.css',
      '/css/screen.css'
    ]

    js_compression  :jsmin      # Optional
    css_compression :sass       # Optional
  }

  set :public_folder, File.dirname(__FILE__) + '/static'
  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    haml :index
  end
end

Splash.run! :port => 4000