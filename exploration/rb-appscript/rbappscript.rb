#!/usr/bin/ruby
require 'rubygems'
require 'open4'

player9 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app/Contents/MacOS/Flash Player"
player10 = "/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/10.0.22.87/Flash Player.app/Contents/MacOS/Flash Player"

player = player10

good_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
bad_swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/InstantRuntimeException.swf'

player = player.split(' ').join('\ ')
# Thread.abort_on_exception = true

player_thread = Thread.new {
  system("#{player}")
  puts "player closed"
}

command = "ruby /Users/lbayes/Projects/CLIXFlashPlayer/exploration/rb-appscript/child_process.rb"
activate_pid = open4.popen4(command)[0]

# Signal.trap('SIGINT', activate_pid) do
#   puts "SIGINT D ENCOUNTERED!"
# end

puts "Player Launched with #{activate_pid}"
# Process.wait(activate_pid)

begin
  if(player_thread.alive?)
    player_thread.join
  end
rescue StandardError => e
  puts ">> rescued player join with: #{player_thread}"
end

begin
  puts "kill process with: #{activate_pid}"
  Process.kill("KILL", activate_pid)
rescue StandardError => e
  puts ">> rescued from killer with: #{e}"
end

puts "Player Returned from: #{activate_pid}"
