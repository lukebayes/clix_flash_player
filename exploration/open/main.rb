#!/usr/bin/ruby
require 'rubygems'
require 'open4'

class FlashPlayer
  
  attr_accessor :pid, :read, :write, :error
  
  def initialize(player, swf)
    @thread = Thread.new {
      system("osascript ../applescript/OSAFlashPlayer.scpt '#{player}' '#{swf}'")
    }
    
  end
  
  def join
    @thread.join
  end
  
  def kill

  end
  
end


player = FlashPlayer.new('/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app', 'Users:lbayes:Projects:CLIXFlashPlayer:exploration:fixtures:SomeProject.swf')
puts "Player Returned"

player.join

trap 'SIGHUP' do
  print "Trapped SIGHUP!"
  player.kill
end