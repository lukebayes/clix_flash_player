
thread = Thread.new {
  sleep(100)
}


Signal.trap('SIGINT') do
  puts "SIGINT ENCOUNTERED!"
  thread.kill!
  # open_thread.kill!
  # $stdout.puts "open thread killed"
  # player_thread.kill!
  # $stdout.puts "player thread killed"
  # Appscript.app(player).quit
  # $stdout.puts "player quit"
end

thread.join