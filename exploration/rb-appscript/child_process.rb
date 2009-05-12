#!/usr/bin/ruby
require 'rubygems'
require 'appscript'

player9 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
player10 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/10.0.22.87/Flash Player.app/Contents/MacOS/Flash Player"

player = player10

good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

swf = good_swf

# Give the player focus:
Appscript.app(player).activate
puts "activate succeeded"
Appscript.app(player).open(MacTypes::Alias.path(swf))
puts "open succeeded"

