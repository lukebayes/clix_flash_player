require 'rubygems'
require 'open4'

class CLIXFlashPlayer
  
  def initialize
    @activate_pid = nil
    @player_pid = nil
    @player_thread = nil
    @thread = nil
  end
  
  def execute(player, swf)
    @thread = Thread.new {
      player = File.expand_path(player)
      swf = File.expand_path(swf)
    
      @player_thread = Thread.new {
        @player_pid = open4.popen4("#{player.split(' ').join('\ ')}")[0]
        Process.wait(@player_pid)
        puts "player closed"
      }

      # puts "about to activate and open"
      wrapper = File.expand_path(File.dirname(__FILE__) + '/clix_wrapper.rb')
      command = "ruby #{wrapper} '#{player}' '#{swf}'"
      puts command
      @activate_pid = open4.popen4(command)[0]
      puts "Player Launched with #{@activate_pid}"

      begin
        if(@player_thread.alive?)
          puts "joining on player thread now"
          @player_thread.join
        end
      rescue StandardError => e
        puts ">> rescued player join with: #{@player_thread}"
      end

      puts "Player Returned from: #{@activate_pid}"
    }
  end
  
  def kill
    begin
      puts "kill process with: #{@activate_pid}"
      # Process.kill("KILL", @activate_pid)
      # Process.wait(@activate_pid)
      exec("kill -9 #{@player_pid}")
      puts "killing thread: #{@player_thread}"
      # @player_thread.kill
    rescue StandardError => e
      puts ">> rescued from killer with: #{e}"
    end
  end
  
  def join
    @thread.join
  end
  
  def alive?
    return @thread.alive?
  end
end

