require 'test_helper'

class TimersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @timer = timers(:one)
    @other_timer = timers(:two)
  end
  
  test "should get new" do
    get stopwatch_path
    assert_response :success
  end
  
end
