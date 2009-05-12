#!/usr/bin/ruby

player = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app'
swf = 'Users:lbayes:Projects:CLIXFlashPlayer:exploration:fixtures:SomeProject.swf'

thread = Thread.new {
  system("osascript -s e applescript/OSAFlashPlayer.scpt '#{player}' '#{swf}'")
}

puts "Player Launched"
thread.join
puts "Player Returned"

# trap 'SIGHUP' do
#   print "Trapped SIGHUP!"
#   player.kill
# end