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

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    js :app, '/js/app.js', [
      '/js/vendor/**/*.js',
      '/js/app/**/*.js'
    ]

    css :application, '/css/application.css', [
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