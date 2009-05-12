#!/usr/bin/ruby

player = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app'
swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'

thread = Thread.new {
  exec("open -W '#{player}' '#{swf}'")
}

thread.join
puts "Player Returned"
