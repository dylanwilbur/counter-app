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
  
  test "should redirect show when logged in as wrong user" do
    log_in_as(@other_timer)
    get timer_path(@timer)
    assert_redirected_to timer_path(@other_timer)
  end

end
