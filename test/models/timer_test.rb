require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @timer = Timer.new(time: 1)
  end
end
