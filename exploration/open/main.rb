#!/usr/bin/ruby
require 'rubygems'
require 'open4'

class FlashPlayer
  
  attr_accessor :player, :swf
  
  def initialize
    @player = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/9.0.151/Flash Player.app'
    @swf = '/Users/lbayes/Projects/CLIXFlashPlayer/exploration/fixtures/SomeProject.swf'
  end
  
  # Causes the launch of two Flash Players
  def open_double_bug
    @thread = Thread.new {
      exec("open -W '#{player}' '#{swf}'")
    }
  end
  
  
  def join
    @thread.join
  end
  
end

player = FlashPlayer.new
player.open_double_bug

player.join
puts "Player Returned"
