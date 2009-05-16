require File.dirname(__FILE__) + '/test_helper'

class CLIXFlashPlayerTest <  Test::Unit::TestCase

  def setup
    @fixtures = File.join(File.dirname(__FILE__) + '/../', 'exploration', 'fixtures')
    @flash_player10 = File.join(@fixtures, '10.0.22.87', 'Flash Player.app')
    @flash_player9 = File.join(@fixtures, '9.0.151', 'Flash Player.app')
    
    @good_swf = File.join(@fixtures, 'SomeProject.swf')
    @bad_swf = File.join(@fixtures, 'InstantRuntimeException.swf')
  end
  
  def teardown
    super
  end

  def test_nil_player
    player = CLIXFlashPlayer.new
    assert_raise CLIXFlashPlayerError do
      player.execute(nil, @good_swf)
    end
  end
  
  def test_bad_player_target
    player = CLIXFlashPlayer.new
    assert_raise CLIXFlashPlayerError do
      player.execute('foo', @good_swf)
    end
  end
  
  def test_nil_swf
    player = CLIXFlashPlayer.new
    assert_raise CLIXFlashPlayerError do
      player.execute(@flash_player9, nil)
    end
  end

  def test_bad_swf_target
    player = CLIXFlashPlayer.new
    assert_raise CLIXFlashPlayerError do
      player.execute(@flash_player9, 'foo')
    end
  end

=begin  
  def test_good_swf
    player = CLIXFlashPlayer.new
    player.execute(@flash_player9, @good_swf)
    sleep(4.0)
    player.kill
    player.join
  end

  def test_bad_swf
    player = CLIXFlashPlayer.new
    player.execute(@flash_player9, @bad_swf)
    sleep(4.0)
    player.kill
    player.join
  end
=end

end