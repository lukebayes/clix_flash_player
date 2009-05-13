#!/usr/bin/ruby
require 'rubygems'
require 'appscript'

# player9 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
# player10 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/10.0.22.87/Flash Player.app/Contents/MacOS/Flash Player"

# player = player10

# good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
# bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

# swf = good_swf

player = ARGV[0]
swf = ARGV[1]

puts "argv 0: #{player}"
puts "argv 1: #{swf}"

if(player.nil?)
  raise "CLIXWrapper requires 'player' argument like:\nruby clix_wrapper [player] [swf]"
end

if(swf.nil?)
  raise "CLIXWrapper requires 'swf' argument like:\nruby clix_wrapper [player] [swf]"
end

# player = File.expand_path(player).split(' ').join('\ ')
# swf = File.expand_path(swf).split(' ').join('\ ')


# Give the player focus:
Appscript.app(player).activate
puts "activate succeeded"
# Open the SWF:
Appscript.app(player).open(MacTypes::Alias.path(swf))
puts "open succeeded"

