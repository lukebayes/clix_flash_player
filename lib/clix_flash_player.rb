require 'rubygems'
require 'open4'

class CLIXFlashPlayer
  
  def initialize
    @activate_pid = nil
    @player_pid = nil
    @thread = nil
    setup_trap
  end
  
  def execute(player, swf)
    @thread = Thread.new {
      player = File.expand_path(player)
      swf = File.expand_path(swf)
      puts "------------------"
      puts "CLIXFlashPlayer.execute with: #{player} and #{swf}"
      @player_pid = open4.popen4("#{player.split(' ').join('\ ')}")[0]
      puts "Player started with player_pid: #{@player_pid}"
      wrapper = File.expand_path(File.dirname(__FILE__) + '/clix_wrapper.rb')
      command = "ruby #{wrapper} '#{player}' '#{swf}'"
      puts command
      @activate_pid = open4.popen4(command)[0]
      puts "Activate started with activate_id: #{@activate_pid}"
      puts "Waiting for Player Close"
      Process.wait(@player_pid)
    }
  end
  
  def kill
    puts "kill with: #{@player_pid}"
    exec("kill -9 #{@player_pid}")
  end
  
  def join
    @thread.join
  end
  
  def alive?
    return @thread.alive?
  end
  
  private
  
  def setup_trap
    # Trap the CTRL+C Interrupt signal
    # Which prevents nasty exception messages
    Kernel.trap('INT') do
      if(@thread.alive?)
        @thread.kill
      end
    end
  end
  
end

