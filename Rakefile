require 'rubygems'
require 'bundler'
require 'coffee-script'

desc 'Generate the documentation for Splash!'
task :docs do
  sh 'rocco lib/**/*.coffee --output=docs/'
end

desc 'Compile files for testing purposes'
task :test do
  Dir.glob('lib/*.coffee').each do |coffee|
  	name = (coffee.split('.')[0]) + '.js'
  	File.open('test/' + name, 'w+') { |file| file.write(CoffeeScript.compile File.read(coffee)) }
  end
  Dir.glob('lib/**/*.coffee').each do |coffee|
  	name = (coffee.split('.')[0]) + '.js'
  	File.open('test/' + name, 'w+') { |file| file.write(CoffeeScript.compile File.read(coffee)) }
  end
end