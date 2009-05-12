#!/usr/bin/ruby
require 'rubygems'
require 'appscript'

player9 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
player10 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/10.0.22.87/Flash Player.app/Contents/MacOS/Flash Player"

player = player10

good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

swf = good_swf

# Open the player direectly without a SWF file:
player_thread = Thread.new {
  system("'#{player}'")
  puts "player closed"
}

# Give the player focus:
activate_thread = Thread.new {
  Appscript.app(player).activate
  puts "activate succeeded"
  Appscript.app(player).open(MacTypes::Alias.path(swf))
  puts "open succeeded"
}

puts "Player Launched"
player_thread.join
puts "Player Returned"
