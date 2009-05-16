require 'rubygems'
require 'open4'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class CLIXFlashPlayerError < StandardError; end

class CLIXFlashPlayer
  VERSION = '0.1.0'
  
  def initialize
    @activate_pid = nil
    @player_pid = nil
    @thread = nil
    setup_trap
  end
  
  def execute(player, swf)
    validate(player, swf)
    @thread = Thread.new {
      player = File.expand_path(File.join(player, 'Contents', 'MacOS', 'Flash Player'))
      swf = File.expand_path(swf)
      @player_pid = open4.popen4("#{player.split(' ').join('\ ')}")[0]
      wrapper = File.expand_path(File.dirname(__FILE__) + '/clix_wrapper.rb')
      command = "ruby #{wrapper} '#{player}' '#{swf}'"
      @activate_pid = open4.popen4(command)[0]
      Process.wait(@player_pid)
    }
  end
  
  def kill
    system("kill -9 #{@player_pid}")
  end
  
  def join
    @thread.join
  end
  
  def alive?
    return @thread.alive?
  end
  
  private
  
  def validate(player, swf)
    raise CLIXFlashPlayerError.new("Player must not be nil") if(player.nil? || player == '')
    raise CLIXFlashPlayerError.new("Player cannot be found: '#{player}'") if(!File.exists?(player))

    raise CLIXFlashPlayerError.new("SWF must not be nil") if(swf.nil? || swf == '')
    raise CLIXFlashPlayerError.new("SWF cannot be found: '#{swf}'") if(!File.exists?(swf))
  end
  
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

