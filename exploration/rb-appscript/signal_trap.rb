
thread = Thread.new {
  sleep(100)
}


Signal.trap('SIGINT') do
  puts "SIGINT ENCOUNTERED!"

  open_thread.kill!
end

thread.join