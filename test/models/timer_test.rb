require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @now = Time.now
    @timer = Timer.new()
  end
  
  test "should be valid" do
    assert @timer.valid?
  end
  
  test "should get correct time" do
    sleep(2)
    correct_time = (Time.now - @now).floor
    assert_equal(2, correct_time)
    puts "correct time: " + correct_time.to_s
    assert_equal(correct_time, @timer.elapsed_time)
  end
end
