require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @now = Time.now
    @timer = Timer.new()
  end
end
