#!/usr/bin/ruby
require 'rubygems'
require 'appscript'

player = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

# Open the player direectly without a SWF file:
player_thread = Thread.new {
  system("'#{player}'")
  puts "player closed"
}

# Give the player focus:
activate_thread = Thread.new {
  Appscript.app(player).activate
  puts "activate succeeded"
}

puts "working"

open_thread = Thread.new {
  Appscript.app(player).open(MacTypes::Alias.path(good_swf))
  puts "open succeeded"
}

puts "Player Launched"
open_thread.join
player_thread.join

puts "Player Returned"
