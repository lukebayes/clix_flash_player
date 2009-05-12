#!/usr/bin/ruby

player_app = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app'
player_bin = "#{player_app}/Contents/MacOS/Flash Player"
swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'

# Fails because Player.app is a directory:
# thread = Thread.new {
#   exec("'#{player_app}' '#{swf}'")
# }

thread = Thread.new {
  exec("'#{player_bin}' '#{swf}'")
}

thread.join
puts "Player Returned"
