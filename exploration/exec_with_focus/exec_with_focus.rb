#!/usr/bin/ruby
require 'rubygems'
require 'appscript'

player = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

thread = Thread.new {
  # Works great if there is no exception!
  # system("'#{player}' '#{good_swf}'")

  # Try it with a runtime exception:
  system("'#{player}' '#{bad_swf}'")
}

# Locks process with runtime exception:
Appscript.app(player).activate

puts "Player Launched"
thread.join
puts "Player Returned"
