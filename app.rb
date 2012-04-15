require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/assetpack'
require 'sinatra/subdomain'
#require 'haml'
#require 'coffee-script'

# Source: https://gist.github.com/119874
module Sinatra::Partials
  def partial(template, *args)
    template_array = template.to_s.split('/')
    template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
    options = args.last.is_a?(Hash) ? args.pop : {}
    options.merge!(:layout => false)
    locals = options[:locals] || {}
    if collection = options.delete(:collection) then
      collection.inject([]) do |buffer, member|
        buffer << haml(:"#{template}", options.merge(:layout =>
        false, :locals => {template_array[-1].to_sym => member}.merge(locals)))
      end.join("\n")
    else
      haml(:"#{template}", options)
    end
  end

  def cp(path)
    "active" if ('/' + path) == request.path_info
  end
end

# Application class
class Splash < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  register Sinatra::Subdomain
  helpers Sinatra::Partials

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
      '/js/index.js',
      '/js/models/*.js',
      '/js/views/*.js',
      '/js/desktop/*.js',
      '/js/desktop/views/*.js',
      '/js/web.js'
    ]

    js :slim, '/js/slim.js', [
      '/js/vendor/jquery.js'
    ]


    css :application, '/css/application.css', [
      '/css/normalize.css',
      '/css/screen.css'
    ]

    js_compression  :jsmin      # Optional
    css_compression :sass
  }

  set :public_folder, File.dirname(__FILE__) + '/static'
  set :views, File.dirname(__FILE__) + '/views'

  # Renders mobile pages
  subdomain :m do
    get '/' do
      haml :m, :layout => false
    end
  end

  # Sub-domain for all API requests
  #subdomain :api do
  #end

  get '/' do
    if params[:mobile]
      haml :m, :layout => false
    else
      haml :index
    end
  end

  get '/about' do
    haml :about, :layout => :slim
  end

  get '/contact' do
    haml :contact, :layout => :slim
  end

  get '/help' do
    haml :help, :layout => :slim
  end

  get '/mobile' do
    haml :mobile, :layout => :slim
  end

  get '/api' do
    haml :api, :layout => :slim
  end
end

Splash.run! :port => 4000