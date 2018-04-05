require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @start = Time.now
    @timer = Timer.new()
  end
  
  test "should be valid" do
    assert @timer.valid?
  end
  
  test "should get correct time" do
    sleep(2)
    correct_time = (Time.now - @start).floor
    assert_equal(2, correct_time)
    assert_equal(correct_time, @timer.elapsed_time)
  end
end
