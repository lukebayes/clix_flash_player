%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/clix_flash_player'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "clix_flash_player"
    gemspec.summary = "Command Line Interface wrapper for Flash Player on OS X"
    gemspec.email = "josh@technicalpickles.com"
    gemspec.homepage = "http://github.com/technicalpickles/the-perfect-gem"
    gemspec.description = "The Flash Player on OS X does not appropriately allow the command line to control it."
    gemspec.authors = ["Luke Bayes"]
    gemspec.files.exclude('exploration/**/*')
    gemspec.add_dependency('open4', '>= 0.9.6')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

# require 'newgem/tasks' # load /tasks/*.rake
# Dir['tasks/**/*.rake'].each { |t| load t }
