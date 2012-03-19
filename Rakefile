require 'rubygems'
require 'bundler'
require 'rocco'

desc 'Generate the documentation for Splash!'
task :docs do
  sh 'rocco lib/*.coffee --output=docs/'
  sh 'rocco lib/models/*.coffee --output=docs/'
  sh 'rocco lib/helpers/*.coffee --output=docs/'
end