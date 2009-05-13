require File.dirname(__FILE__) + '/test_helper'

class CLIXFlashPlayerTest <  Test::Unit::TestCase

  def setup
    @fixtures = File.join(File.dirname(__FILE__) + '/../', 'exploration', 'fixtures')
    @flash_player10 = File.join(@fixtures, '10.0.22.87', 'Flash Player.app', 'Contents', 'MacOS', 'Flash Player')
    @flash_player9 = File.join(@fixtures, '9.0.151', 'Flash Player.app', 'Contents', 'MacOS', 'Flash Player')
    
    @good_swf = File.join(@fixtures, 'SomeProject.swf')
    @bad_swf = File.join(@fixtures, 'InstantRuntimeException.swf')
  end
  
  def teardown
    super
  end
  
  def test_good_swf
    player = nil

    player = CLIXFlashPlayer.new
    player.execute(@flash_player9, @good_swf)

    # sleep(4.0)
    # puts "killing now"
    # player.kill
    player.join
    
  end

end